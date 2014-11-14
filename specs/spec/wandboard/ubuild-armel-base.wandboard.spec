# ubuild .spec file that creates an armel (armv7,
# softfp) image for the CubieBoard3.
#include ../../headers/wandboard/base.wandboard.header

[ubuild]
build_dir = /var/tmp/ubuild.wandboard-armel.build_dir
compile_dir = /var/tmp/ubuild.wandboard-armel.compile_dir
cache_dir = ../../../cache/wandboard.armel.cache/
image_name = armv7l.softfp.wandboard.img.xz
env = ../../architecture_env/cubieboard/armel/env
cross_env = ../../architecture_env/cubieboard/armel/cross_env
