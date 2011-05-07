module ApplicationHelper
  def avatar_url(user)
    gravatar_id = Digest::MD5.hexdigest(user.email)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=24"
  end

  def icon_link_to(icon, href)
    link_to content_tag(:span, "", {:class => "ui-icon ui-icon-#{icon}"}), href
  end
end
