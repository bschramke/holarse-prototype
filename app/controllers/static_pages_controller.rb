#encoding: utf-8
class StaticPagesController < ApplicationController

  layout "doku", only: [:markdownhelp]

  def imprint
    add_breadcrumb "Impressum"
  end

  def intro
    add_breadcrumb "Einführung"
  end

  def markdownhelp
    add_breadcrumb "Markdown-Hilfe"
  end

end
