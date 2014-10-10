# ubuild .spec file that creates an armel (armv7,
# hardfp) image for the BeagleBoard.

#include base.beagleboard.header

[ubuild]
build_dir = /var/tmp/ubuild.cubieboard3-armhf.build_dir
compile_dir = /var/tmp/ubuild.cubieboard3-armhf.compile_dir
cache_dir = ../../../cache/cubieboard3.armhf.cache/
image_name = armv7l.hardfp.CubieBoard3.img.xz
env = ../../architecture_env/armhf/env
cross_env = ../../architecture_env/armhf/cross_env
