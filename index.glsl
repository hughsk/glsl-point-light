vec3 point_light(
  const vec3 color,
  const vec3 light_position,
  const vec3 current_position,
  const vec3 normal,
  const vec3 k
) {
  float dist = distance(light_position, current_position);
  float attenuation = 1.0 / (k.x+(k.y*dist)+(k.z*dist*dist));

  return color * attenuation * max(dot(normal, normalize(current_position - light_position)), 0.0);
}

#pragma glslify: export(point_light)
