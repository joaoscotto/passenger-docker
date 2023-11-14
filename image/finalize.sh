#!/bin/bash
set -e
source /pd_build/buildconfig

header "Finalizing..."

if [[ -e /usr/local/rvm ]]; then
	run /usr/local/rvm/bin/rvm cleanup all
fi


if [[ "$final" != 1 ]]; then
	run rm -f /pd_build/{install,enable_repos,prepare,nginx-passenger,finalize,install_base,install_image,update_baseimage,utilities}.sh
	run rm -f /pd_build/{Dockerfile,Dockerfile.base,insecure_key*}
fi
# rm -rf /bd_build
