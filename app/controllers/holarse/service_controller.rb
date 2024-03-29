# encoding: utf-8
class Holarse::ServiceController < ApplicationController

  add_breadcrumb "Holarse"
  add_breadcrumb "Services"

  def index
    add_breadcrumb "Übersicht"
  end

  def mumble
    add_breadcrumb "Mumble"
  end

  def jabber
    add_breadcrumb "IRC und Jabber"
  end

  def gameserver
    add_breadcrumb "Gameserver"
  end

  def communities
    add_breadcrumb "Communities"
  end
end
