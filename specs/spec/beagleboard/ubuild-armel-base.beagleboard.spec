# ubuild .spec file that creates an armel (armv7,
# softfp) image for the BeagleBoard.

#include ../../headers/beagleboard/base.beagleboard.header

[ubuild]
build_dir = /var/tmp/ubuild.beagleboard-armel.build_dir
compile_dir = /var/tmp/ubuild.beagleboard-armel.compile_dir
cache_dir = ../../../cache/beagleboard.armel.cache/
image_name = armv7l.softfp.BeagleBoard.img.xz
env = ../../architecture_env/armel/env
cross_env = ../../architecture_env/armel/cross_env
