#!/bin/sh

# iProxy 실행 스크립트
echo "===== iProxy 실행 스크립트 ====="
echo "기본값을 사용하려면 입력없이 Enter 키를 누르세요."

# 기본값 설정
DEFAULT_ADDR="172.20.10.1"
DEFAULT_BIND="0.0.0.0"
DEFAULT_SOCKS_PORT="1080"
DEFAULT_HTTP_PORT="8080"
DEFAULT_DISCOVERY_PORT="8088"

# 호스트 주소 입력
echo ""
echo "프록시 호스트 주소 [기본값: $DEFAULT_ADDR]:"
read addr
if [ -z "$addr" ]; then
    addr=$DEFAULT_ADDR
fi

# 바인딩 주소 입력
echo "바인딩 주소 [기본값: $DEFAULT_BIND]:"
read bind
if [ -z "$bind" ]; then
    bind=$DEFAULT_BIND
fi

# SOCKS5 프록시 포트 입력
echo "SOCKS5 프록시 포트 [기본값: $DEFAULT_SOCKS_PORT, 비활성화: 0]:"
read socks_port
if [ -z "$socks_port" ]; then
    socks_port=$DEFAULT_SOCKS_PORT
fi

# HTTP 프록시 포트 입력
echo "HTTP 프록시 포트 [기본값: $DEFAULT_HTTP_PORT, 비활성화: 0]:"
read http_port
if [ -z "$http_port" ]; then
    http_port=$DEFAULT_HTTP_PORT
fi

# 자동 구성 디스커버리 포트 입력
echo "프록시 자동 구성 포트 [기본값: $DEFAULT_DISCOVERY_PORT, 비활성화: 0]:"
read discovery_port
if [ -z "$discovery_port" ]; then
    discovery_port=$DEFAULT_DISCOVERY_PORT
fi

# 위치 추적 활성화 여부
echo "위치 추적 활성화 (앱 휴면 방지에 도움) [y/N]:"
read enable_location
if [ "$enable_location" = "y" ] || [ "$enable_location" = "Y" ]; then
    location_flag="-l"
else
    location_flag=""
fi

# 상세 출력 활성화 여부
echo "상세 출력 활성화 [y/N]:"
read enable_verbose
if [ "$enable_verbose" = "y" ] || [ "$enable_verbose" = "Y" ]; then
    verbose_flag="-v"
else
    verbose_flag=""
fi

# 명령어 구성
cmd="./iproxy -a $addr -b $bind"

# 포트값이 0이 아닌 경우에만 플래그 추가
if [ "$socks_port" != "0" ]; then
    cmd="$cmd -s $socks_port"
fi

if [ "$http_port" != "0" ]; then
    cmd="$cmd -p $http_port"
fi

if [ "$discovery_port" != "0" ]; then
    cmd="$cmd -d $discovery_port"
fi

# 위치 추적 및 상세 출력 플래그 추가
if [ -n "$location_flag" ]; then
    cmd="$cmd $location_flag"
fi

if [ -n "$verbose_flag" ]; then
    cmd="$cmd $verbose_flag"
fi

# 최종 명령어 표시 및 실행
echo ""
echo "실행할 명령어: $cmd"
echo "iProxy를 시작합니다..."
echo ""

# 실행
eval $cmd

# 스크립트 종료 