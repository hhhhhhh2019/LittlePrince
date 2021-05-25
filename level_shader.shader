shader_type canvas_item;

uniform float angle;
uniform vec2 resolution;
uniform sampler2D night;

void fragment() {
	vec2 point = vec2(0, 1) * mat2(
		vec2(cos(angle), -sin(angle)),
		vec2(sin(angle), cos(angle))
	);
	
	float a = dot(point, vec2(0, 1)) / 2. + 0.5;
	
	vec3 color = mix(vec3(0.9, 0.8, 0.5), vec3(0.5, 0.5, 1), a - 0.5);
	
	COLOR.rgb = mix(texture(night, FRAGCOORD.xy / resolution).rgb, color, a);
}