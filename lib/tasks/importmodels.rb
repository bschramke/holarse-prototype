class ImportModel < ActiveRecord::Base
    self.abstract_class = true

    establish_connection(
      adapter: "mysql",
      database: "holarse",
      username: "migration",
      password: "migrationpassword",
      host: "localhost"
    )   
end 

class ImportComment < ImportModel
  self.table_name = "comments"
  self.primary_key = "cid"

  belongs_to :user, class_name: "ImportUser", foreign_key: "uid"
  default_scope { where("status = 0") }

  def convert
    CommentConverter.new.convert(self)
  end 
end

class ImportArticle < ImportModel
  self.table_name = "node"
  self.primary_key = "nid"
  self.inheritance_column = "type2"

  belongs_to :user, class_name: "ImportUser", foreign_key: "uid"
  belongs_to :node_revisions, class_name: "ImportNodeRevision", foreign_key: "vid"
  has_many :comments, class_name: "ImportComment", foreign_key: "nid"

  default_scope { where("type = ?", ["page"]).where("status = 1") }

  class ImportNodeRevision < ImportModel
    self.table_name = "node_revisions"
    self.primary_key = "vid"

    default_scope { where("body <> ''") }
  end

  def convert
    ArticleConverter.new.convert(self)
  end

end

class ImportUser < ImportModel
  self.table_name = "users"
  self.primary_key = "uid"

  def convert
    UserConverter.new.convert(self)
  end

  belongs_to :signature, class_name: "ImportUserSignature", foreign_key: "uid"
  has_and_belongs_to_many :roles, class_name: "ImportRole", join_table: "users_roles", foreign_key: "uid", association_foreign_key: "rid"

  default_scope { where("name is not null or name <> '' and mail is not null and mail <> '' and pass is not null and pass <> ''").where("uid > 0") }

  class ImportUserSignature < ImportModel
    self.table_name = "users_signature"
    self.primary_key = "uid"
  end

  class ImportRole < ImportModel
    self.table_name = "role"
    self.primary_key = "rid"

    def convert
      RoleConverter.new.convert(self)
    end

  end
end

