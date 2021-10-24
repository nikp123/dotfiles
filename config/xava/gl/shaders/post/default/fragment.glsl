#version 420 core

in vec2 texCoord;

uniform sampler2D color_texture;
uniform sampler2D depth_texture;

uniform vec4 background_color;

layout(location=0) out vec4 FragColor;

vec4 correctForAlphaBlend(vec4 color) {
	return vec4(color.rgb*color.a, color.a);
}

vec4 append_color_properly(vec4 source, vec4 target) {
	target.a    = target.a > source.a ? target.a : source.a;
	target.rgb += source.rgb*target.a;
	return target;
}

void main() {
	vec4 depth = texture(depth_texture, texCoord);

	// test if infinite
	FragColor = background_color;
	FragColor = append_color_properly(
		texture(color_texture, texCoord),
		FragColor);

	//FragColor = correctForAlphaBlend(FragColor);
}

