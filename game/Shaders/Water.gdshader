shader_type canvas_item;

uniform float t : hint_range(0.0, 1.0);
uniform sampler2D edgeNoise : source_color;
uniform sampler2D waveNoise : source_color;
uniform sampler2D oppWaveNoise : source_color;
uniform float noiseStrength;
uniform float causticThreshold : hint_range(0,1);
uniform vec3 waterColor : source_color;
uniform vec3 foamColor : source_color;
uniform float waveHeight;
uniform float waveWidth;
uniform float waveEdgeWidth;

varying vec2 numPixels;

vec2 pixelateUV(vec2 uv, vec2 amount) {
	return  round(uv * amount+0.5) / amount;
}

vec2 getWorldPos(vec2 uv, mat4 modelMatrix) {
	return (modelMatrix * vec4(uv, 0.0, 1.0)).xy;
}

void vertex() {
    vec2 worldPos = getWorldPos(VERTEX,MODEL_MATRIX);
	vec2 worldPosPlus = getWorldPos(VERTEX + vec2(1,1),MODEL_MATRIX);
	numPixels = worldPosPlus - worldPos;
}

void fragment() {
	vec2 uv = pixelateUV(UV,numPixels);
	float time = 2. * PI * fract(TIME);
	float noiseValue = texture(edgeNoise,uv).r * noiseStrength;
	vec2 causticOffset = 0.1 * vec2(0,-sin(2.*TIME) + noiseValue);
	float caustic = texture(waveNoise,fract(uv + causticOffset)).r + texture(oppWaveNoise,fract(uv - causticOffset)).r;
	caustic = caustic / 2.;
	caustic = step(causticThreshold,caustic);
	float threshold = (1. - t) + waveHeight * sin((1./waveWidth)*uv.x+time) + noiseValue;
	float steppedWave = step(waveEdgeWidth,uv.y-threshold) * caustic;
	vec3 color = mix(foamColor,waterColor,steppedWave);
	COLOR = vec4(color,step(0,uv.y - threshold));
}
