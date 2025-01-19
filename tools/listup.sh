# 指定されたディレクトリ配下を再帰的に検索し、音楽ファイルのリストを出力するスクリプト

function usage() {
  echo -e "./listup.sh [ディレクトリ名]"
}

if [ $# -ne 1 ]; then
  usage
  exit 1
fi

DIR="$1"

if [ ! -d "$DIR" ]; then
  echo "ディレクトリが存在しません"
  exit 1
fi

MUSIC_FILE_EXT='\.mp3$|\.flac$|\.wav$|\.m4a$|\.ogg$|\.wma$|\.aac$|\.aiff$|\.ape$|\.alac$|\.dsf$|\.dff$|\.mqa$|\.mp4$'

for file_path in $(find "$DIR" -type f | grep -E "$MUSIC_FILE_EXT"); do
  mediainfo "$file_path" | grep -E '^(File name|Duration|Bit rate|Album|Performer|Track name|Track name/Position|Track name/Total|Performer|Composer|Genre|Recorded date|Encoded date|Cover)' | sed -e 's/^ +//'
done
