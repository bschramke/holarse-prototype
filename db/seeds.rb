# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Role.delete_all
Role.create([{name: 'admin'},{name: 'reporter'}, {name: 'moderator'}])
puts "#{Role.count} Rollen angelegt"

NewsCategory.delete_all
NewsCategory.create([{name: 'announcement', description: 'Ankündigung'}, {name: 'release', description: 'Veröffentlichung'}, {name: 'patch', description: "Patch"}, {name: 'video', description: 'Videonews'}, {name: 'audio', description: 'Podcast'}, {name: 'hardware', description: 'Hardware'}])
puts "#{NewsCategory.count} News-Kategorien angelegt"

ProjectActivityState.delete_all
ProjectActivityState.create([{name: 'Aktiv', code: "active"}, {name: 'Entwicklung stockt', code: "pending"}, {name: 'Inaktiv', code: "inactive"}, {name: 'Tot', code: "dead"}])
puts "#{ProjectActivityState.count} Projekt-Aktivitaets-Zustaende angelegt"
