# Holarse 2013
Die neue Webseite von Holarse - Spielen unter Linux wird wieder in Eigenregie erstellt. Wir können dadurch auf eine Vielzahl von Generikas und Umwegen verzichten und uns direkt auf unser Kernthema stürzen.

## Build-Status
![Status](https://travis-ci.org/commel/holarse.png)

## Software
* JRuby: 1.7.2 oder höher
* Java: OpenJDK 7 oder Oracle JDK 7
* Rails: 4.0 oder höher

## Installation

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
Webserver starten mit 
```
$ rails s
```
Einen Multithreaded-Webserver könnt ihr mit
```
$ rails s puma
```
starten.
