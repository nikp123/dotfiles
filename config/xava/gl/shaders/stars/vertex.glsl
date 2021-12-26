#version 430 core

// input vertex and texture coordinate
in vec4 v_texCoord; // vertex
in vec2 m_texCoord; // mapping

// output texture map coordinate
out vec2 texCoord;

uniform float intensity;

layout(std430, binding = 2) buffer theFuckDOICare {
	float data_SSBO[];
};

void main() {
	data_SSBO[0] += intensity;

	gl_Position = v_texCoord;
	texCoord    = m_texCoord;
} 
