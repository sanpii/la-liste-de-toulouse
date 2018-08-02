Lots de scripts permetant de tester l’accès aux sites de la [liste de
Toulouse](https://dsi.ut-capitole.fr/blacklists/) et d’importer les données dans
une base postgresql afin de faire des statistiques dessus.

# Test

Attention, ce script va lancer des requêtes vers des sites considérés comme
indésirables par de nombreuses personnes, prennez vos précautions !

On commence par générer le fichier de données :

```
./src/test > fai.tsv
```

# Import

```
psql --command 'CREATE DATABASE blacklists';
./src/import
```

# Rapport

Pour géréner le rapport PDF, il suffit d’installer
[rstudio](https://www.rstudio.com/) et [pandoc](http://pandoc.org/) puis
d’exécuter la commande :

```
make
```
