#!/bin/sh

# iSH에서 iProxy 설치 스크립트
echo "===== iProxy 설치 스크립트 (iSH용) ====="

# 필요한 패키지 설치
echo "필요한 패키지 설치 중..."
apk add curl

# 디렉토리 생성
echo "작업 디렉토리 생성 중..."
mkdir -p ~/iproxy
cd ~/iproxy

# GitHub에서 파일 다운로드
echo "실행 스크립트 다운로드 중..."
curl -L -o run_iproxy.sh https://raw.githubusercontent.com/yldst-dev/iproxy/master/run_iproxy_ish.sh
chmod +x run_iproxy.sh

# 바이너리 다운로드
echo "iProxy 바이너리 다운로드 중..."
# GitHub 릴리스에서 다운로드하는 것이 이상적이지만, 임시로 직접 다운로드 URL을 사용
curl -L -o iproxy https://github.com/yldst-dev/iproxy/raw/master/iproxy_ish
chmod +x iproxy

echo ""
echo "설치가 완료되었습니다!"
echo "다음 명령어로 iProxy를 실행할 수 있습니다:"
echo "cd ~/iproxy && ./run_iproxy.sh"
echo ""
echo "지금 iProxy를 실행하시겠습니까? [y/N]"
read start_now

if [ "$start_now" = "y" ] || [ "$start_now" = "Y" ]; then
    ./run_iproxy.sh
fi 