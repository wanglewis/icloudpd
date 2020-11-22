# icloudpd
 
additional commandline options see:
~~https://github.com/shuixin536/icloud_photos_downloader~~


- use:  
`docker pull wanglewis/icloudpd:latest`

- volume:  
`/data` for photos
`/config` for cookies

- env:  

| key | value |
| ------ | ------ |
| USERNAME | icloud user name |
| TZ | Timezone | 
| CRON | 0 */6 * * * | 
| CLIFOPTIONS  | This is for additional commandline options you want to pass to the icloudpd application. |  
| FOLDERSTRUCTURE  | folder structure, such as {:%Y/%m/%d} OR {:%Y/%m} |

