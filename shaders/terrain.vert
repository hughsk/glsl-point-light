attribute vec3 position;
attribute vec3 normal;

uniform vec3 uAmbientColor;
uniform vec3 uaPointColor;
uniform vec3 ubPointColor;
uniform vec3 uaPointPosition;
uniform vec3 ubPointPosition;

uniform mat4 projection;
uniform mat4 model;
uniform mat4 view;

varying vec3 vPosition;
varying vec3 vLightWeighting;

#pragma glslify: lighting = require(../index)

const vec3 falloff = vec3(1.0, 0.05, 0.3);

// Needed to convert the position
// vector into screen space to line up with
// 3D their actual position.
vec3 trans(vec3 pos) {
  return (model * vec4(pos, 1.0)).xyz;
}

void main() {
  gl_Position = projection * view * model * vec4(position, 1.0);

  vLightWeighting = uAmbientColor
    + lighting(uaPointColor, uaPointPosition, trans(position), normal, falloff) * 1.5
    + lighting(ubPointColor, ubPointPosition, trans(position), normal, falloff) * 1.5
    ;
}
