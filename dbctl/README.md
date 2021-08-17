# dbctl

`dbctl` 은 데이터베이스 파일을 업데이트 하는데 사용됩니다.

## 새로운 PR 영상을 추가하기

1. PR 영상의 유튜브 주소를 획득합니다.
2. 아래 스크립트를 실행합니다 (bash 기준).

   ```bash
   youtube_links=(
     https://youtu.be/-5fFL68d7Gg
     https://youtu.be/I9kQwMbpxuE
     https://youtu.be/HWf8CmTAIR4
     https://youtu.be/FFXAm2uTmeI
     https://youtu.be/20kxrS2yglg
     https://youtu.be/BZwUR9hvBPE
     https://youtu.be/hptinxZIXT4
   )

   for youtube in ${youtube_links[@]}
   do
     go run main.go youtube --youtube-link $youtube >> ../server/internal/data/mapping_table.pbtxt
   done
   ```
