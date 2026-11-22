#!/bin/sh
set -e
DIR=$(mktemp -d)
trap 'rm -rf "$DIR"' EXIT
MIRROR=https://github.com/coredns/coredns/releases/download

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local platform="${os}_${arch}"
    local file=coredns_${ver}_${platform}.tgz.sha256
    local url=$MIRROR/v$ver/$file
    local sum
    sum=$(curl -fsSL --proto '=https' --tlsv1.2 "$url" | awk '{print $1}')
    if ! printf '%s' "$sum" | grep -Eq '^[0-9a-f]{64}$'
    then
        echo "bad or missing checksum for $url: '$sum'" >&2
        exit 1
    fi
    printf "    # %s\n" "$url"
    printf "    %s: sha256:%s\n" "$platform" "$sum"
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

dl_ver ${1:-1.15.0}
