module Holarse
  module Revisionable
    extend ActiveSupport::Concern

    protected

    def save_revision
      self.revisions << Revision.new(changedset: self.to_json, user: self.user, event: self.new_record? ? "create" : "update")
    end

  end
end

ActiveRecord::Base.send(:include, Holarse::Revisionable)
