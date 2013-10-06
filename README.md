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
* `vec3 attenuation`: the light attenuation.

Light attenuation is the rate at which the light will fade over space. It's
passed as a vector for brevity, but each value has a different effect:

* `attenuation.x`, or `kc`, is the constant attenuation.
* `attenuation.y`, or `kl`, is the linear attenuation.
* `attenuation.z`, or `kq`, is the quadratic attenuation.

Together these values effect the final attenuation curve. For more information
check out this
[this article](http://imdoingitwrong.wordpress.com/2011/01/31/light-attenuation/).

See [shaders/terrain.vert](https://github.com/hughsk/ndarray-continuous/blob/master/shaders/terrain.vert) for a full example.
