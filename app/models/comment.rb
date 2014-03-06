#encoding: utf-8
class Comment < ActiveRecord::Base
  # referenzen
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  # validierungen
  validates_presence_of :user, message: "Benutzer muss gesetzt sein!"
  validates_presence_of :content, message: "Leertext ist nicht möglich!"

  default_scope { where(enabled: true) }
end
