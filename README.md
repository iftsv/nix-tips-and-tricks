# nix-tips-and-tricks

### Shortcuts for Checking Internet Connection at the OS Level

1) ICMP + DNS
```
ping bd
ping cm
ping uz
```

2) Only ICMP
```
ping 1.1
ping 1.0
ping 1.9
```

3) Get your External IP
```shell
curl ip.me
curl ifconfig.me
```

Bonus:
repo.new / meet.new / sheet.new / doc.new


### Download video from streaming Platform (getcourse.ru)
1) Locate and get m3u8 playlist file. Then download `*.bin` segments.
```
cat 01_480.m3u8 | grep '^https' | xargs -n 1 -P 10 curl -O
```
2) Merge `*.bin` segments and convert to mp4 file
```
ls *.bin | sort -n -t . -k1,1 | xargs cat > merged.ts
ffmpeg -i merged.ts -c copy webinar_01.mp4
```
