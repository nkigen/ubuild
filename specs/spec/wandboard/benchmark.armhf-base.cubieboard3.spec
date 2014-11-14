#include base.cubieboard3.header

[ubuild]
cache_dir = ../../../cache/benchmark-base.armhf.cubieboard3.cache/
cross_env = ../../architecture_env/armhf/cross_env
build_dir = /var/tmp/ubuild.cubieboard3-armhf-base.build
compile_dir = /var/tmp/ubuild.cubieboard3-armhf-base.compile
image_name = benchmark.armhf-base.cubieboard3.img.xz
env = ../../architecture_env/armhf/env

[pkg=benchmark]
build = ../../scripts/build_pkg_benchmark.sh
cache_vars = BENCHMARK_CFLAGS_CONFIG BENCHMARK_CFLAGS_MD5
env = ../../benchmark_env/armhf-base
#sources = SoundTest
#url = http://lxnay.sabayon.org/ubuild/SoundTest.tar.gz

