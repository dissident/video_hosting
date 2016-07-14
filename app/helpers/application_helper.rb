module ApplicationHelper

  def check_active_url(url)
    if request.path == url
      'active'
    else
      ''
    end
  end
end
