# glsl-point-light [![stable](http://hughsk.github.io/stability-badges/dist/stable.svg)](http://github.com/hughsk/stability-badges) #

A reusable GLSL point light function for use with
[glslify](http://github.com/chrisdickinson/glslify).

[![glsl-point-light](http://i.imgur.com/Sh0ceiW.png)](http://hughsk.github.com/glsl-point-light)

**[view demo](http://hughsk.github.com/glsl-point-light)**


## Usage ##

[![glsl-point-light](https://nodei.co/npm/glsl-point-light.png?mini=true)](https://nodei.co/npm/glsl-point-light)

Exports `vec3 point_light`, which takes the following arguments:

* `vec3 color`: the RGB values of the light.
* `vec3 light_position`: the x/y/z position of the light.
* `vec3 current_position`: the x/y/z position of the current fragment/vertex.
* `vec3 normal`: a normalized normal vector for the current fragment/vertex.
* `vec3 radius`: the radius of the light source.

You must also specify your lighting's attenuation properties when requiring
this module:

``` glsl
#pragma glslify: light_a = require(glsl-point-light, kc=1.0, kl=0.05, kq=0.05)
#pragma glslify: light_b = require(glsl-point-light, kc=1.0, kl=0.04, kq=0.025)
```

In other words, these variables will effect the rate at which your light fades
over space. `kc` is the constant attenuation, whereas `kl` is linear and `kq`
is quadratic. For more information check out
[this article](http://imdoingitwrong.wordpress.com/2011/01/31/light-attenuation/).

See [shaders/terrain.vert](https://github.com/hughsk/ndarray-continuous/blob/master/shaders/terrain.vert) for a full example.
