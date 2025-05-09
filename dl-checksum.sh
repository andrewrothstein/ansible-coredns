#!/bin/sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/coredns/coredns/releases/download

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local platform="${os}_${arch}"
    local file=coredns_${ver}_${platform}.tgz.sha256
    local url=$MIRROR/v$ver/$file
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(curl -sSL $url | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    printf "  '%s':\n" $ver
    dl $ver darwin amd64
    dl $ver linux amd64
    dl $ver linux arm
    dl $ver linux arm64
    dl $ver linux mips
    dl $ver linux mips64le
    dl $ver linux ppc64le
    dl $ver linux s390x
    dl $ver windows amd64
}

dl_ver ${1:-1.12.1}
