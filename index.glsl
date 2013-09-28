const float kc;
const float kl;
const float kq;

vec3 point_light(
  const vec3 color,
  const vec3 light_position,
  const vec3 current_position,
  const vec3 normal
) {
  float dist = distance(light_position, current_position);
  float attenuation = kc / ((1.0 + kl*dist)*(1.0 + kq*dist*dist));

  return color * attenuation * max(dot(normal, normalize(current_position - light_position)), 0.0);
}

#pragma glslify: export(point_light)
