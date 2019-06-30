# icloudpd
- source:  
`https://github.com/shuixin536/icloud_photos_downloader`

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