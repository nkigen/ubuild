# ubuild .spec file that creates an armel (armv7,
# softfp) image for the BeagleBoard.

#include base.beagleboard.header

[ubuild]
build_dir = /var/tmp/ubuild.cubieboard3-armel.build_dir
compile_dir = /var/tmp/ubuild.cubieboard3-armel.compile_dir
cache_dir = ../../../cache/cubieboard3.armel.cache/
image_name = armv7l.softfp.CubieBoard3.img.xz
env = ../../architecture_env/armel/env
cross_env = ../../architecture_env/armel/cross_env
