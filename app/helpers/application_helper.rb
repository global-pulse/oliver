require 'rexml/document'

module ApplicationHelper
  def avatar_url(user)
    gravatar_id = Digest::MD5.hexdigest(user.email)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=24"
  end

  def icon_link_to(*args)
    icon         = args[0]
    options      = args[1]
    html_options = args[2]
#    args[0] = content_tag(:span, "", {:class => "ui-icon ui-icon-#{icon}"})
#    link_to args
    link_to content_tag(:span, "", {:class => "ui-icon ui-icon-#{icon}"}), options, html_options
  end

  def format_raw_data(data)
    formatter = REXML::Formatters::Pretty.new(2)
    s         = ""
    formatter.write(REXML::Document.new(data), s)
    s
  end
end
