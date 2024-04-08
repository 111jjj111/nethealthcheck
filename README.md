# nethealthcheck
## 기능
서버 보안상 외부로부터 핑이 차단되었을 때 간단하게 서버 헬스체크를 하는 코드입니다.
## 사용법
linux에 `crontab`을 이용하여 **netcheck**코드를 주기적으로 실행시켜 네트워크에 문제가 생겼을 시 디스코드 웹훅을 통해 알람이 오게 설정합니다.
그리고 **discordhook**를 통해 일정시간마다 서버가 정상적임을 알립니다.
### 이미지
<img width="378" alt="스크린샷 2024-04-08 오후 7 33 41" src="https://github.com/111jjj111/nethealthcheck/assets/95969488/142b3d54-650d-4540-8616-028f80bceef7">
