# ubuild .spec file that creates an armel (armv7,
# softfp) image for the BeagleBone.

#include base.beaglebone.header

[ubuild]
build_dir = /var/tmp/ubuild.beaglebone-armhf.build_dir
cache_dir = beaglebone.armhf.cache/
image_name = armv7l.hardfp.BeagleBone.img.xz
env = scripts/armhf/env
cross_env = scripts/armhf/cross_env