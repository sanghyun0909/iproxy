# iProxy 설치 가이드 (아이폰 iSH용)

이 가이드는 맥북에서 컴파일한 iProxy 바이너리를 아이폰의 iSH에서 사용하는 방법을 설명합니다.

## 옵션 1: 바이너리 직접 전송 (권장)

### 1. 맥북에서 바이너리 컴파일
맥북에서 다음 명령을 실행하여 iSH용 바이너리를 컴파일합니다:
```
GOOS=linux GOARCH=386 CGO_ENABLED=0 go build -o iproxy_ish
```

### 2. 아이폰으로 바이너리 전송
다음 방법 중 하나를 선택하여 `iproxy_ish` 파일을 아이폰으로 전송합니다:
- AirDrop으로 전송
- iCloud Drive나 다른 클라우드 서비스 사용
- 이메일로 자신에게 전송

### 3. iSH에서 바이너리 사용하기
1. 아이폰의 "파일" 앱에서 전송된 `iproxy_ish` 파일을 찾습니다.
2. "iSH" 앱을 엽니다.
3. iSH에서 다음 명령을 실행하여 작업 디렉토리를 생성합니다:
   ```
   mkdir -p ~/iproxy
   cd ~/iproxy
   ```
4. iSH에서 스크립트를 다운로드합니다:
   ```
   apk add curl
   curl -L -o run_iproxy.sh https://raw.githubusercontent.com/yldst-dev/iproxy/master/run_iproxy_ish.sh
   chmod +x run_iproxy.sh
   ```
5. "파일" 앱에서 iSH의 디렉토리로 `iproxy_ish` 파일을 복사합니다.
   - iSH의 파일 시스템은 보통 `/private/var/mobile/Containers/Data/Application/[UUID]/Documents`에 있습니다.
   - 또는 iSH에서 `pwd` 명령을 사용하여 현재 경로를 확인할 수 있습니다.
6. iSH에서 바이너리 이름을 변경하고 실행 권한을 부여합니다:
   ```
   mv iproxy_ish iproxy
   chmod +x iproxy
   ```
7. 실행 스크립트를 실행합니다:
   ```
   ./run_iproxy.sh
   ```

## 옵션 2: 자동화된 설치 스크립트 사용 (추후 지원 예정)

현재 바이너리의 크기 때문에 GitHub에서 직접 다운로드가 제한됩니다. 향후 릴리스에서는 자동화된 설치 스크립트를 제공할 예정입니다.

## 명령어 한 줄로 실행하기 (바이너리가 이미 iproxy 디렉토리에 있는 경우)

이미 바이너리가 준비되어 있다면 아래 명령어로 간단히 실행할 수 있습니다:
```
cd ~/iproxy && ./run_iproxy.sh
``` 