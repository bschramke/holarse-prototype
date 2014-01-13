#encoding: utf-8
class DraftableController < ApplicationController

  protected

  def save_as_draft?
    params.key? "save-as-draft"
  end

  def save_or_draft(model)
    Draft.new(draftable: model, user: current_user, draftedtext: model.to_json)
  end

  def persist(model)
    save_as_draft? ? create_draft(model).save : model.save
  end

end
