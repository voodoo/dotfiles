get_dbs(){
  scp vudu@mmcolo.macminicolo.net:/Volumes/Backup/dbdumps/cms.sql.gz ~/code/dbbackups/ 
  scp vudu@mmcolo.macminicolo.net:/Volumes/Backup/dbdumps/pvr.sql.gz ~/code/dbbackups/ 
  gunzip -f ~/code/dbbackups/cms.sql.gz
  gunzip -f ~/code/dbbackups/pvr.sql.gz

  import_dbs  
}

import_dbs(){

  mysql -uroot -e 'drop database if exists cms'
  mysql -uroot -e 'create database cms'

  mysql -uroot -e 'drop database if exists pvr'
  mysql -uroot -e 'create database pvr'

  mysql -uroot cms < ~/code/dbbackups/cms.sql
  mysql -uroot pvr < ~/code/dbbackups/pvr.sql

}