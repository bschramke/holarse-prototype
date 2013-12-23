#encoding: utf-8
class IntroductionController < ApplicationController

  add_breadcrumb "Einführung"

  def index
    add_breadcrumb "Anfang"
  end

end
