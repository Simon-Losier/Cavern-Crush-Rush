shader_type canvas_item;

//needs to be manually adjusted when fire placed
uniform vec3 outerColor : source_color;
uniform vec3 innerColor : source_color;
uniform float colorThreshold = 0.05;
uniform sampler2D noise;
uniform float noiseStrength = 0.1;
uniform float topWidth;
uniform float width;
uniform float height;
uniform vec2 flameCenter;

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

float sdEgg( in vec2 p, float a,in float b, in float h ) 
{
    p.x = abs(p.x);
    float r = (a-b);
    h+=r;
    float l=(h*h - r*r)/(2.*r);  
    return ((-p.y <= 0.)          ? length(p)   - a :
           (((-p.y-h)*l > p.x*h)   ? length(p-vec2(0.,-h)) - ((a+l)-length(vec2(h,-l))) : 
                                   length(p+vec2(l,0.)) - (a+l)));
}

float flame(vec2 uv, float time) {
	vec2 modifiedUV = uv-0.5;
	float circle = sdEgg(modifiedUV - flameCenter,width,topWidth,height);
	vec2 noiseUV = fract(uv+vec2(0,time));
	float noiseValue = texture(noise,noiseUV).r*noiseStrength;
	return circle-noiseValue;
}

void fragment() {
	vec2 pixelUV = pixelateUV(UV,numPixels);
	float flame = flame(pixelUV,TIME);
	float boundaryFlame = step(-colorThreshold,flame);
	vec3 color = mix(innerColor,outerColor,boundaryFlame);
	COLOR = vec4(color,step(0,-flame));
}
