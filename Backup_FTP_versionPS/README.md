# Backup_FTP

Mes premières lignes de codes avec PowerShell.

**Objectif :** créer un script PS pour effectuer le backup d'un site/dossier directement depuis le server FTP.

**Pourquoi :**
  * automatiser la sauvegarde d'un site/dossier, et ainsi éviter de le faire manuellement (lancer son client FTP, se connecter, etc).
  * pour les utilisateurs de WordPress = se passer d'un plugin encombrant et à l'efficacité douteuse !

**Les sources :** beaucoup de recherches et de bouts de codes issus du web.

**Client FTP utilisé :** [WinSCP 5.17](https://winscp.net/eng/index.php), très bonne découverte, à la différence de FileZilla, il peut se piloter en lignes de commande et en plus il vous les fournit !!

**Le process :** choix du site/dossier à sauvegarder > connexion au server FTP > téléchargement du site/dossier > compression et archivage.

**Évolution :** vient en complément du repo [Backup_DB](https://github.com/BertrandPeltier/Backup_DB), codé en Php, qui consiste à faire un backup de la base de données.

**Améliorations :**
  * le chantier des variables !!
  * crypter les données de connexion qui sont externalisées dans un fichier .ini
  * grouper (pourquoi pas) les données de connexion de tous les sites dans un seul fichier, à voir le type/format
 
 **Bugs/Failles :**
   * Déconnexions régulières du server lors des 1iers tests sur des backups de gros sites... En manuel, aucun problème.
