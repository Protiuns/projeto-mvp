shader_type canvas_item;

uniform sampler2D noise: repeat_enable;
uniform sampler2D noise2: repeat_enable;
uniform vec2 scroll = vec2(0.05 , 0.05);
uniform vec2 scroll2 = vec2(-0.03 , 0.02);
uniform float velocidade = 0.03 ; 
uniform sampler2D texturaTela : hint_screen_texture , filter_linear_mipmap;
uniform float distorcao_tela: hint_range(-1 , 1) = 0.2;
uniform vec4 cor_agua :source_color;

uniform vec4 cor_topo :source_color;

void fragment() {
	float profundidade = texture(noise , UV + scroll * TIME).r * texture(noise2 , UV + scroll2 * TIME).r;
	vec4 screen_col = texture( texturaTela, SCREEN_UV + distorcao_tela * profundidade);
	COLOR = screen_col * cor_agua; 
}
