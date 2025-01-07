shader_type canvas_item;

uniform float radius : hint_range(0.0, 1.0) = 0.6; // Raio do círculo (0 a 1, relativo ao tamanho da textura)
uniform vec2 center = vec2(0.5, 0.5); // Centro do círculo (normalizado: 0 a 1)

void fragment() {
    vec2 uv = UV; // Coordenadas UV
    float dist = distance(uv, center); // Calcula a distância até o centro

    if (dist > radius) {
        discard; // Descarte pixels fora do círculo
    } else {
        COLOR = texture(TEXTURE, uv); // Mostra pixels dentro do círculo
    }
}
