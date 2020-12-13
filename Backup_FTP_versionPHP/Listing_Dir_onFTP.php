<?php
     
     $path = '/htdocs/'; // Chemin du répertoire       A REMPLIR !!!
      $dp = opendir($path);

      $i=0;
      while ( $file = readdir($dp) )
      {
        // enleve les fichiers . et ..
        if ($file != '.' && $file != '..')
        {
                // on passe les datas dans un tableau
                $ListFiles[$i]=$file;
                $i++;
        }
     }
      closedir($dp);

      // tri par ordre décroissant

      $list_tri = 'DESC'; //         A REMPLIR !!!

      if(count($ListFiles)!=0)
      {
         if($list_tri == 'DESC')
         {
             rsort($ListFiles);
         }
         else
         {
             sort($ListFiles);
         }
      }

    // affiche les fichiers par ordre alphabetique décroissant
      $i=0;
      while ( $i < count($ListFiles))
      {
          echo $ListFiles[$i].'<br/>';
          $i++;
      }

?>