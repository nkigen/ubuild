#include base.beagleboard.header

[ubuild]
cache_dir = ../../../cache/benchmark-base.armel.cubieboard3.cache/
cross_env ../../= architecture_env/armel/cross_env
build_dir = /var/tmp/ubuild.cubieboard3-armel-base.build
compile_dir = /var/tmp/ubuild.cubieboard3-armel-base.compile
image_name = benchmark.armel-base.cubieboard3.img.xz
env = ../../architecture_env/armel/env

[pkg=benchmark]
build = ../../scripts/build_pkg_benchmark.sh
cache_vars = BENCHMARK_CFLAGS_CONFIG BENCHMARK_CFLAGS_MD5
env = ../../benchmark_env/armel-base
#sources = SoundTest
#url = http://lxnay.sabayon.org/ubuild/SoundTest.tar.gz

