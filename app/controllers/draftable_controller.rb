#encoding: utf-8
class DraftableController < ApplicationController

  protected

  def save_or_draft(model)
    save_as_draft? ? create_draft(model).save! : model.save!
  end

  private

  def create_draft(model)
    Draft.new(draftable_id: model.id, draftable_type: model.class.to_s, user: current_user, draftedtext: model.to_json)
  end

  def save_as_draft?
    logger.debug(params)
    params.key? "save-as-draft"
  end

end
