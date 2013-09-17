# Holarse 2013
Die neue Webseite von Holarse - Spielen unter Linux wird wieder in Eigenregie erstellt. Wir können dadurch auf eine Vielzahl von Generikas und Umwegen verzichten und uns direkt auf unser Kernthema stürzen.

## Software
* JRuby: 1.7.2 oder höher
* Java: OpenJDK 7 oder Oracle JDK 7

## Installation

### Ruby On Rails
~
$ gem install bundler
$ gem install jruby-openssl
~
Im Holarse-Verzeichnis dann: `$ bundle install`

### Datenbank

### Testdatensätze
Dieser Tasks erstellt 10 normale User und 1 Admin-User. Das Passwort entspricht jeweiles dem Benutzernamen.

~
$ rake holarse:demo:users
$ rake holarse:demo:news
~

oder für alle Testdatensätze

~
$ rake holarse:demo:install
~

### Tests
Zuerst die Testdatenbank erzeugen mit `$ rake db:setup RAILS_ENV=test` und dann die Tests aufrufen mit: `$ rspec `

### Starten
Webserver starten mit `$ rails s`

## Repository-Konfiguration
Es werden Github und Bitbucket gleichzeitig verwendet, wobei Github nur einen Mirror darstellt. Ändert dazu die Git-Konfiguration in `.git/config` ab.

~
[core]
  repositoryformatversion = 0
  filemode = true
  bare = false
  logallrefupdates = true
[remote "origin"]
  fetch = +refs/heads/*:refs/remotes/origin/*
  url = git@bitbucket.org:holarse/holarse.git
  url = git@github.com:commel/holarse.git
[branch "master"]
  remote = origin
  merge = refs/heads/master
~
