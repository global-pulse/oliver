require 'rexml/document'

module ApplicationHelper
  def avatar_url(user)
    gravatar_id = Digest::MD5.hexdigest(user.email)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=24"
  end

  def icon_link_to(icon, href)
    link_to content_tag(:span, "", {:class => "ui-icon ui-icon-#{icon}"}), href
  end

  def format_raw_data(data)
    formatter = REXML::Formatters::Pretty.new(2)
    s = ""
    formatter.write(REXML::Document.new(data), s)
    s
  end
end
