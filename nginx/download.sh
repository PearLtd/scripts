#!/bin/sh -e

# Linux: 
# nginxVer=$(curl 'http://nginx.org/download/' | 
#   grep -oP 'href="nginx-\K[0-9]+\.[0-9]+\.[0-9]+' | 
#   sort -t. -rn -k1,1 -k2,2 -k3,3 | head -1)
# MacOS:
# latestVer=$(curl 'http://nginx.org/download/' | 
# egrep -o 'href="nginx-[0-9]+\.[0-9]+\.[0-9]+' | sed 's/^href="nginx-//' |
# sort -t. -rn -k1,1 -k2,2 -k3,3 | head -1)

nginxVer=$(curl -L 'http://nginx.org/download/' | 
   grep -oP 'href="nginx-\K[0-9]+\.[0-9]+\.[0-9]+' | 
   sort -t. -rn -k1,1 -k2,2 -k3,3 | head -1)
pcreVer=$(curl -l -L 'ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/' | 
   grep -oP 'pcre-\K[0-9]+\.[0-9]+' | 
   sort -t. -rn -k1,1 -k2,2 -k3,3 | head -1)
zlibVer=$(curl -L 'http://www.zlib.net/' | 
   grep -oP 'zlib-\K[0-9]+\.[0-9]+\.[0-9]+' | 
   sort -t. -rn -k1,1 -k2,2 -k3,3 | head -1)
opensslVer=$(curl -L 'https://www.openssl.org/source/' | 
   grep -oP 'openssl-\K[0-9]+\.[0-9]+\.[A-Za-z0-9]+' | 
   sort -t. -rn -k1,1 -k2,2 -k3,3 | head -1)

nginxFile=nginx-${nginxVer}.tar.gz
pcreFile=pcre-${pcreVer}.tar.gz
zlibFile=zlib-${zlibVer}.tar.gz
opensslFile=openssl-${opensslVer}.tar.gz

echo ${nginxFile}
echo ${pcreFile}
echo ${zlibFile}
echo ${opensslFile}

curl -L http://nginx.org/download/${nginxFile} -O
tar xzvf ${nginxFile}
mv nginx-${nginxVer} nginx

curl -L ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/${pcreFile} -O
tar xzvf ${pcreFile}
mv pcre-${pcreVer} pcre

curl -L http://zlib.net/${zlibFile} -O
tar xzvf ${zlibFile}
mv zlib-${zlibVer} zlib

curl -L https://www.openssl.org/source/${opensslFile} -O
tar xzvf ${opensslFile}
mv openssl-${opensslVer} openssl

git clone git://github.com/arut/nginx-rtmp-module.git

