module RespondHelper

  def respond_include_tags
    respond_js = javascript_path('respond.proxy.js')
    respond_js.gsub! /^\/\//, request.protocol
    tags = [ javascript_include_tag(respond_js) ]

    unless ActionController::Base.asset_host.nil?
      proxy_html = asset_path('respond-proxy.html')
      proxy_html.gsub! /^\/\//, request.protocol

      proxy_gif = image_path('respond.proxy.gif')
      proxy_gif.gsub! ActionController::Base.asset_host, "#{request.protocol}#{request.host_with_port}"

      proxy_js = javascript_path('respond.proxy.js')
      proxy_js.gsub! ActionController::Base.asset_host, "#{request.protocol}#{request.host_with_port}"

      tags << tag('link', :href => proxy_html, :id => 'respond-proxy', :rel => 'respond-proxy')
      tags << tag('link', :href => proxy_gif, :id => 'respond-redirect', :rel => 'respond-redirect')
      tags << javascript_include_tag(proxy_js)
    end

    tags.join("\n").html_safe
  end

end
