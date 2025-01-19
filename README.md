# myMusic
自宅サーバ上に保存されている音楽ファイルをローカルにダウンロードするためのスクリプト

# 使い方
## 事前準備
mediainfo をインストールしてください。
```
brew install mediainfo
```

## 音楽ファイルリストのアップデート
```commandline
ssh mac.mini /usr/local/bin/mediainfo /Volumes/mac-server-ssd/data/music > music_list.txt
```