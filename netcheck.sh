#!/bin/bash
env
# 포트 열기
start_network_check() {
    nc -l 12345 > /dev/null 2>&1 &
}

# 네트워크 상태 확인 함수
check_network_status() {
    local result=$(nc -vz localhost 12345 2>&1)
    if [[ $result != *"succeeded"* ]]; then
        echo "네트워크에 문제가 발생했습니다."
        send_discord_message
    else
        echo "네트워크 연결이 정상적입니다."

    fi
}

# Discord에 메시지를 보내는 함수
send_discord_message() {
    curl -X POST \
	 -H "Content-Type: application/json" \
         -d '{	 "embeds": [{
	       	 "title": "네트워크에 문제가 발생했습니다 !",
      	  	 "description": "'"$CURRENT_TIME"'\nIP: '"$SERVER_IP"'",
       		 "color": "16711680"
     		 }]
		}' \
	"$DISCORD_WEBHOOK_URL"
}
# Discord Webhook URL 변수 정의
DISCORD_WEBHOOK_URL="YOUR URL"
SERVER_IP=$(hostname -I)
CURRENT_TIME=$(TZ=Asia/Seoul date "+%Y-%m-%d-%H:%M:%S")
# 포트 열기
start_network_check

# 네트워크 상태 확인
check_network_status

# 백그라운드에서 실행 중인 nc 프로세스 종료
pkill -f "nc -l 12345"
