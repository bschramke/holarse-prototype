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

