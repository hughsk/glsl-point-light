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

#pragma glslify: lighting = require(../index, kc=1.0, kl=0.05, kq=0.08)

// Needed to convert the light and normal
// vectors into screen space to line up with
// gl_Position.
vec3 project(vec3 pos, mat4 projection) {
  return (projection * vec4(pos, 1.0)).xyz;
}

void main() {
  mat4 trans = projection * view;
  gl_Position = trans * model * vec4(position, 1.0);

  vLightWeighting = uAmbientColor
    + lighting(uaPointColor, project(uaPointPosition, trans), gl_Position.xyz, project(normal, trans)) * 0.25
    + lighting(ubPointColor, project(ubPointPosition, trans), gl_Position.xyz, project(normal, trans)) * 0.25
    ;
}
