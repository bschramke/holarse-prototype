class AddDiscountEventRefToComments < ActiveRecord::Migration
  def change
    add_column :comments, :discount_event_id, :integer
    add_column :discount_events, :commentable, :boolean, default: true
  end
end
