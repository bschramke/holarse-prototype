class ArticleConverter
  def convert(article)
    return nil if article.node_revisions.nil?
    Article.new(
                title: article.title,
                content: article.node_revisions.present? ? article.node_revisions.body : "",
                created_at: Time.at(article.created).to_datetime,
		updated_at: Time.at(article[:changed]).to_datetime,
                user: User.find_by_username!(article.user.name),
		comments: article.comments.map(&:convert),
		genre_list: article.tags.map(&:convert)
                )
  end
end

class CommentConverter
  def convert(comment)
    Comment.new(
      user: User.find_by_username!(comment.user.name),
      content: comment.comment,
      created_at: Time.at(comment.timestamp).to_datetime,
      updated_at: Time.at(comment.timestamp).to_datetime
    )
  end 
end

class UserConverter
  def convert(user)

    pv = ImportUser.connection.select_all("SELECT fid, value FROM profile_values WHERE uid = #{user.uid} and fid in (1,2,3,8,10,12,13)")

    User.new(
      username: user.name,
      email: user.mail,
      old_password_hash: user.pass,
      created_at: Time.at(user.created).to_datetime,
      signature: user.signature.present? ? user.signature.signature : nil,
      active: user.status,
      roles: user.roles.map(&:convert),
      minecraft_username: get_pv(pv, 13),
      minecraft_whitelisted: get_pv(pv, 12),
      city: get_pv(pv, 1),
      job: get_pv(pv, 2),
      graphics: get_pv(pv, 6),
      jabber: get_pv(pv, 8),
      distro: get_pv(pv, 10)
    )
  end

  private

  def get_pv(result, field) 
    result = result.rows.select {|a| a[0] == field}
    return result.flatten[1]
  end
  
end

class RoleConverter

  @@modify = {"Administrator" => "admin", "Reporter" => "reporter"}

  def convert(role)
    Role.find_or_create_by(name: @@modify.key?(role.name)? @@modify[role.name] : role.name)
  end
end
