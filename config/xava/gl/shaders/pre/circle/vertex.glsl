#ifdef GL_ES
	precision mediump float;
#endif

// input vertex
attribute vec4 pos;

// foreground color
uniform vec4 color;

// screen width and height
uniform vec2 u_resolution;

// projection matrix precalculated by XAVA
uniform mat4 projectionMatrix;

// output color used by the fragment shader
varying vec4 v_color;

const float pi = 3.141592653589793;

uniform float u_time;

void main() {
	vec4 mpos = pos*projectionMatrix;
	mpos.y += 1.0;
	mpos.y /= 2.0*1.41;
	mpos.x += 1.0;
	mpos.x /= 2.0;
	float angle = pi*(mpos.x*2.0+u_time/20.0);
	mpos.x = cos(angle)*mpos.y-sin(angle)*mpos.y;
	mpos.y = sin(angle)*mpos.y+cos(angle)*mpos.y;
	gl_Position = mpos;
	v_color = color;
}

