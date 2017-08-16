module ApplicationHelper
    
      def avatar_url(user)
    if user.avatar.present?
      user.avatar + "?type=large"
    else
      default_url = "http://icons.iconarchive.com/icons/custom-icon-design/silky-line-user/512/user-2-icon.png"
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
      "http://gravatar.com/avatar/#{gravatar_id}.png?d=#{CGI.escape(default_url)}"
    end
  end
    
end
