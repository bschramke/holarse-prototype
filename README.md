# Holarse 2014
Die neue Webseite von Holarse - Spielen unter Linux wird wieder in Eigenregie erstellt. Wir können dadurch auf eine Vielzahl von Generikas und Umwegen verzichten und uns direkt auf unser Kernthema stürzen.

# Code
[![Travis CI](https://travis-ci.org/commel/holarse.png)](https://travis-ci.org/commel/holarse)

[![Code Climate](https://codeclimate.com/github/commel/holarse.png)](https://codeclimate.com/github/commel/holarse)

## Software
* Java: OpenJDK 7 oder Oracle JDK 7
* JRuby: ab 1.7.x
* ElasticSearch: ab 1.0

## Installation

### Externe Komponenten

#### Java
Installiert Java über euer Paketmanagement. Alternativ von http://java.oracle.com herunterladen und installieren.

#### JRuby
Ladet das tar-Archiv von http://www.jruby.org herunter und entpackt es. Das Unterverzeichnis ''bin'' muss im PATH sein. 

#### ElasticSearch
Unsere Suchengine könnt ihr von http://www.elasticsearch.org/ herunterladen. Entpackt das Archiv und startet ES. 

### Ruby On Rails
```
$ gem install bundler
``` 
Im Holarse-Verzeichnis dann: 
```
$ bundle install
```

### Datenbank
Die Datenbank muss einmal initial erstellt werden mit:
```
$ rake db:setup
```

### Tests
Zuerst die Testdatenbank erzeugen mit 
```
$ rake db:setup RAILS_ENV=test
``` 
und dann die Tests aufrufen mit: 
```
$ rspec
```

### Starten
```
$ rails s puma
```
starten.
