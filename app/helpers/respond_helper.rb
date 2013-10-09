module RespondHelper

  def respond_include_tags
    tags = [ javascript_include_tag(javascript_path('respond.js').gsub(/^\/\//, request.protocol)) ]
    unless ActionController::Base.asset_host.nil?
      tags << tag('link', :href => asset_path('respond-proxy.html').gsub(/^\/\//, request.protocol), :id => 'respond-proxy', :rel => 'respond-proxy')
      tags << tag('link', :href => '/respond.proxy.gif', :id => 'respond-redirect', :rel => 'respond-redirect')
      tags << javascript_include_tag('/respond.proxy.js')
    end
    tags.join("\n").html_safe
  end

end
