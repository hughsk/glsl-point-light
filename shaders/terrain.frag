precision mediump float;

varying vec3 vLightWeighting;

void main() {
  vec3 terrainColor = vLightWeighting * vec3(1.0);
  gl_FragColor = vec4(terrainColor, 1.0);
}
