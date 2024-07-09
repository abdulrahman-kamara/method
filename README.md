Projet de gestion des exercices


Description
Ce projet a pour but de développer un algorithme en bash qui gère les enregistrements d'exercices d'un utilisateur selon des règles métier spécifiques. L'algorithme prend en entrée un fichier CSV contenant les données d'enregistrement des exercices et produit en sortie un fichier CSV avec les mêmes données, mais en ajoutant une colonne pour la série et en mettant à jour les valeurs de la série et des vies en fonction des règles métier.


Règles métier
. Un exercice peut être assis ou allongé.
. Un exercice peut être de 5 minutes (niveau=1) ou de 10 minutes (niveau=2).
. Un utilisateur doit effectuer 2 exercices de 5 minutes ou 1 exercice de 10 minutes pour compléter une séance.
. Une pratique est un couple séance assis et séance allongé le même jour.
. Chaque jour d'affilé pratiqué incrémente la série de +1.
. L'utilisateur dispose de 2 vies pour pallier l'absence de pratique sur un jour.
. Chaque jour sans pratique consomme 1 vie.
. Les jours compensés par une vie peuvent être marqués par une ligne "Allonge=False" et "Assis=False".
. Lorsque l'utilisateur a consommé plus de vie qu'il n'en avait, la série est "cassée" et reprend de 0, et 2 vies sont recréditées.
. 1 vie est regagnée tous les 5 jours consécutifs de pratique.
. Le nombre de vie maximal est 2.

Fichiers
algorithme.sh
Ce fichier contient l'algorithme principal qui implémente les règles métier spécifiées. Il prend en entrée un fichier CSV (Enregistrement Ynov.csv) contenant les données d'enregistrement des exercices et produit en sortie un fichier CSV (Sortie_Enregistrement_Ynov.csv) avec les mêmes données, mais en ajoutant une colonne pour la série et en mettant à jour les valeurs de la série et des vies en fonction des règles métier.

test.sh
Ce fichier contient un script de test qui permet d'exécuter des cas de test sur l'algorithme principal. Il définit une fonction run_test qui exécute l'algorithme principal avec un fichier d'entrée de test et compare la sortie obtenue avec la sortie attendue correspondante.

Fichiers d'entrée de test
Pour chaque cas de test, un fichier d'entrée CSV doit être préparé avec les données d'enregistrement des exercices correspondant au scénario de test. Par exemple, test1.csv et test2.csv.

Sorties attendues
Pour chaque cas de test, une sortie attendue doit être définie. Cette sortie représente le contenu attendu du fichier de sortie Sortie_Enregistrement_Ynov.csv après l'exécution de l'algorithme sur le fichier d'entrée correspondant.

Utilisation

1. Exécuter l'algorithme principal avec un fichier d'entrée de test :

bash algorithme.sh Enregistrement Ynov.csv

Cela générera le fichier de sortie Sortie_Enregistrement_Ynov.csv avec les données traitées selon les règles métier.

2. Préparer les fichiers d'entrée de test et les sorties attendues pour les cas de test.

3. Ajouter les cas de test dans le fichier test.sh en utilisant la fonction run_test.
4. Exécuter le script de test :
bash test.sh

Le script exécutera l'algorithme principal avec chaque fichier d'entrée de test et comparera la sortie obtenue avec la sortie attendue correspondante. Il affichera un message de succès ou d'échec pour chaque cas de test.

5. Analyser les résultats et corriger les bugs éventuels dans l'algorithme principal (algorithme.sh) si certains cas de test échouent.

6. Réexécuter le script de test après avoir corrigé les bugs pour vérifier que tous les cas de test passent avec succès.

