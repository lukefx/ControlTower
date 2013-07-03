module ServersHelper

  def up?(server)
    server.status ? content_tag(:i, "", class: "icon-ok") : content_tag(:i, "", class: "icon-remove")
  end

end
