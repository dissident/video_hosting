module ApplicationHelper

  def check_active_url(url)
    p request.path
    if request.path == url
      'active'
    else
      ''
    end
  end
end
