#!/usr/bin/env sh
VER=1.6.3
DIR=~/Downloads
MIRROR=https://github.com/coredns/coredns/releases/download/v${VER}

dl()
{
    local os=$1
    local arch=$2
    local platform="${os}_${arch}"
    local file=coredns_${VER}_${platform}.tgz.sha256
    local url=$MIRROR/$file
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(curl -sSL $url | awk '{print $1}')
}

printf "  '%s':\n" $VER
dl darwin amd64
dl linux amd64
dl linux arm
dl linux arm64
dl linux mips
dl linux ppc64le
dl linux s390x
dl windows amd64


