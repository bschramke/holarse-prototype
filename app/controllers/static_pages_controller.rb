#encoding: utf-8
class StaticPagesController < ApplicationController

  def imprint
    add_breadcrumb "Impressum"
  end

  def intro
    add_breadcrumb "Einführung"
  end

end
