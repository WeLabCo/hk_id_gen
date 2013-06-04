require 'bundler/setup'
Bundler.require(:default)

require "./hk_id_gen"

app = proc do |env|
  ids = hk_id_gen(50)
  html = %Q{ <div style="width:100px; margin:auto;">#{ids.join("<br/>")}</div> }
  p html
  [200, { 'Content-Type' => 'text/html' }, html ]
end

run app
