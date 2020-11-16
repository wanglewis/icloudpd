# icloudpd
- source:  

~~https://github.com/shuixin536/icloud_photos_downloader~~

~~https://github.com/shuixin536/pyicloud~~

~~https://github.com/ndbroadbent/pyicloud~~

`https://github.com/icloud-photos-downloader/icloud_photos_downloader`

需要直接安装即可

`pip install icloudpd`

- use:  
`docker pull shuixin536/icloudpd`

- volume:  
`/data`

- env:  

| key | value |
| ------ | ------ |
| USERNAME | uuuuuu |
| PASSWORD | pppppp | 
| TZ | Asia/Shanghai | 
| CRON | 0 */6 * * * | 
| RECENT | 500 | 
| ALBUM | All Photos 或者 Favorites 或者 某个文件夹的名字 | 
| FOLDERSTRUCTURE | {:%Y/%m/%d} 或者 {:%Y/%m} | 
