# icloudpd
- source:  

~~https://github.com/shuixin536/icloud_photos_downloader~~

~~https://github.com/shuixin536/pyicloud~~

~~https://github.com/ndbroadbent/pyicloud~~

`https://github.com/icloud-photos-downloader/icloud_photos_downloader`

需要直接安装即可

`pip install icloudpd`

- use:  
`docker pull wanglewis/icloudpd`

- volume:  
`/data`

`/config`

- env:  

| key | value |
| ------ | ------ |
| USERNAME | uuuuuu |
| TZ | Asia/Shanghai | 
| CRON | 0 */6 * * * | 
| CLIFOPTIONS  | CODE OPTIONS FROM icloudpd |
| FOLDERSTRUCTURE  | {:%Y/%m/%d} OR {:%Y/%m} |

