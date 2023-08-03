shader_type canvas_item;

uniform sampler2D noise_r: repeat_enable;
uniform sampler2D noise_g: repeat_enable;
uniform sampler2D noise_b: repeat_enable;
uniform vec2 scroll = vec2(0.05 , 0.05);

uniform float distorcao_cores: hint_range(-1 , 1) = 0.02;

void fragment() {
	vec4 grama = texture(TEXTURE , UV);
	float dilatacaoR =texture(noise_r , UV + scroll * TIME).r;
	float dilatacaoG =texture(noise_g , UV + scroll * TIME).r;
	float dilatacaoB =texture(noise_b , UV + scroll * TIME).r;

	COLOR = grama + vec4(dilatacaoR, dilatacaoG , dilatacaoB , 0) * distorcao_cores;
}
