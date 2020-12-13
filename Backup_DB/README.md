# Backup_DB

Mes premières lignes de codes en Php.

**Objectif :** créer un script Php permettant de faire le backup d'une base de données MySQL.

**Pourquoi :**
  * plus rapide que de le faire manuellement depuis PhpMyAdmin
  * pour les utilisateurs de WordPress = se passer d'un plugin encombrant et à l'efficacité douteuse !

**Les sources :** plusieurs codes trouvés sur le web ont été testés, celui-ci marche bien et il était facilement customisable pour un débutant.

**Le process :** exécution depuis un script PS (voir ci-dessous) avec argument > connexion à la base MySQL > exportation > archivage dans un dossier du server FTP

**Évolution :** vient en complément du repo [Backup_FTP](https://github.com/BertrandPeltier/Backup_FTP), codé en PowerShell, qui consiste à faire un backup d'un site/dossier directement sur le server FTP.

**Améliorations :**
  * Il y a des différences entre l'export de la DB avec ce script et celui fait manuellement, surement une sombre histoire de paramétrage... Dans les faits, la restoration test d'un site s'est fait sans problème.
  * Les données de connexion sont externalisées dans un script Php, voir l'utilité de changer de format pour une utilisation multisite.
