module HistoryHelper

  #
  # erzeugt einen link auf eine revision einer news oder eines artikels
  #
  def revision_link(parent, revision)
    link_to revision.index, url_for(:controller => :history, :action => :show, "#{parent.class.name.underscore}_id".to_sym => parent.id, :id => revision.index) unless revision.index == 0
  end

end
