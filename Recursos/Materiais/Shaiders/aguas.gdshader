shader_type canvas_item;

uniform sampler2D noise: repeat_enable;
uniform sampler2D noise2: repeat_enable;
uniform vec2 scroll = vec2(0.05 , 0.05);
uniform vec2 scroll2 = vec2(-0.03 , 0.02);
 
uniform sampler2D texturaTela : hint_screen_texture , filter_linear_mipmap;
uniform float distorcao_tela: hint_range(-1 , 1) = 0.2;
uniform vec4 cor_agua :source_color;

uniform vec4 cor_topo :source_color;
uniform vec4 cor_sombra :source_color;

uniform float comeco_luz:hint_range(0.0, 1.0) = 0.275;
uniform float fim_luz:hint_range(0.0, 1.0) = 0.5;

uniform float comeco_sombra:hint_range(0.0, 1.0) = 0.01;
uniform float fim_sombra:hint_range(0.0, 1.0) = 0.2;

void fragment() {
	float profundidade = texture(noise , UV + scroll * TIME).r * texture(noise2 , UV + scroll2 * TIME).r;
	vec4 screen_col = texture( texturaTela, SCREEN_UV + distorcao_tela * profundidade);
	
	vec4 luz_topo = smoothstep(comeco_luz , fim_luz , profundidade)*cor_topo; 
	
	vec4 sombra_fundo = smoothstep(comeco_sombra , fim_sombra , profundidade)* cor_sombra;
	
	COLOR = screen_col * cor_agua + luz_topo + sombra_fundo; 
	COLOR.a = 1.0;
}
