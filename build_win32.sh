BOOST_SRC=F:/cq/boost_1_54_0_32
JSONCPP_SRC=F:/cq/jsoncpp/jsoncpp
auto/configure --with-cc=cl \
    --prefix= \
    --with-cc-opt="-DFD_SETSIZE=1024 /Y- /EHsc -I${BOOST_SRC} -I${JSONCPP_SRC}\include" \
    --with-pcre=../pcre-8.31 \
    --with-zlib=../zlib-1.2.7 \
    --with-openssl=../openssl-1.0.1c \
    --builddir=objs \
    --conf-path=conf/nginx.conf \
    --pid-path=logs/nginx.pid \
    --http-log-path=logs/access.log \
    --error-log-path=logs/error.log \
    --sbin-path=nginx.exe \
    --http-client-body-temp-path=temp/client_body_temp \
    --http-proxy-temp-path=temp/proxy_temp \
    --http-fastcgi-temp-path=temp/fastcgi_temp \
    --with-select_module --with-http_ssl_module \
    --with-ipv6  \
    --with-ld-opt="/link /LIBPATH:${BOOST_SRC}\stage\lib \
                   libboost_date_time-vc100-mt-s-1_54.lib \
                   libboost_regex-vc100-mt-s-1_54.lib \
                   LIBBoost_system-vc100-mt-s-1_54.lib \
                   /LIBPATH:${JSONCPP_SRC}\rel\lib_json \
                   json_vc71_libmt.lib" \
    --add-module=../../modules/flvplay/src/ngx_http_flvplay \
	--add-module=../../modules/miniuds/src/ngx_http_miniuds \
	--add-module=../../modules/rtmp
    #--add-module=../../src/helloworld 
sed -e 's/-WX//' objs/Makefile > objs/Makefile.w32
