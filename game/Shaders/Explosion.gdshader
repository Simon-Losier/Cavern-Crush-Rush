shader_type canvas_item;

uniform float t : hint_range(0,1);
uniform float maxRadius : hint_range(0,0.5);
uniform float explosionRate : hint_range(6,10);
uniform vec3 smokeColor : source_color;
uniform vec3 shadowColor : source_color;
uniform sampler2D noise : source_color;
uniform vec2 center = vec2(0.5,0.5);

uniform vec2 numPixels = vec2(16,16);
uniform float noiseStrength;
uniform vec3 light;
uniform float offset = 0.01;
uniform float shadowThreshold = 0.3;

vec2 pixelateUV(vec2 uv) {
	return round(uv * numPixels) / numPixels;
}


float merge(float shape1, float shape2) {
	return min(shape1,shape2);
}

float intersect(float shape1, float shape2) {
	return max(shape1,shape2);
}

float subtract(float shape1, float shape2) {
	return intersect(shape1,-shape2);
}

float circle(vec2 position, float radius) {
	return length(position) - radius;
}

vec3 normalFromNoise(vec2 uv) {
	//TODO: Implement
	return vec3(0);
}

float roundedSlope(float x) {
	x = 1. + x;
	return (1. - x * x) > 0. ? sqrt(1. - x * x) : 0.;
}

float sampleNoiseSDF(vec2 uv, float radius, float width) {
	float noiseValue = texture(noise,uv).r;
	float outerCircle = circle(uv-center,radius) + noiseStrength * noiseValue;
	float innerCircle = circle(uv-center,radius-width) + noiseStrength * noiseValue;
	return roundedSlope(subtract(outerCircle,innerCircle));
}

vec3 generateNormal(vec2 uv, float radius, float width) {
	float dx = (sampleNoiseSDF(uv + vec2(offset,0.), radius, width) - sampleNoiseSDF(uv, radius, width))/offset;
	float dy = (sampleNoiseSDF(uv + vec2(0.,offset), radius, width) - sampleNoiseSDF(uv, radius, width))/offset;
	return normalize(vec3(dx,dy,1));
}

float scaleTime(float x, float rate) {
	return 1. - pow(2.,-x * rate);
}

void fragment() st
	vec2 pixelUV = pixelateUV(UV);
	float width = 1. - t;
	float radius = scaleTime(t,explosionRate) *  maxRadius;
	float alpha = sampleNoiseSDF(pixelUV,radius,width) > 0. ? 1. : 0.;
	float lighting = dot(light,generateNormal(pixelUV,radius,width));
	lighting = step(shadowThreshold,lighting);
	vec3 color = mix(shadowColor,smokeColor,lighting);
	COLOR = vec4(color,alpha);
}
