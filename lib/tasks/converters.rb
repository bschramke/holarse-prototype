class UserConverter
  def convert(user)
    User.new(
      username: user.name,
      email: user.mail,
      old_password_hash: user.pass,
      created_at: Time.at(user.created).to_datetime,
      signature: user.signature.present? ? user.signature.signature : nil,
      active: user.status,
      roles: user.roles.map(&:convert)
    )
  end
end

class RoleConverter

  @@modify = {"Administrator" => "admin", "Reporter" => "reporter"}

  def convert(role)
    Role.new(
      name: @@modify.key?(role.name)? @@modify[role.name] : role.name
    )
  end
end
