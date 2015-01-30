# ubuild .spec file that creates an armel (armv7,
# softfp) image for the CubieBoard3.
#include ../../headers/wandboard/base.wandboard.header

[ubuild]
build_dir = /var/tmp/ubuild.wandboard-armhf.build_dir
compile_dir = /var/tmp/ubuild.wandboard-armhf.compile_dir
cache_dir = ../../../cache/wandboard.armhf.cache/
image_name = armv7l.hardfp.wandboard.img.xz
env = ../../architecture_env/cubieboard/armhf/env
cross_env = ../../architecture_env/cubieboard/armhf/cross_env
