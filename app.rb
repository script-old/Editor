require "sinatra"

get '/' do
  redirect to("/index.html")
end
post '/create/upload' do
  halt 500 unless !params['image'].nil?
  image=nil
  image_name = Time.now.to_i.to_s + "_" + params['image'][:filename]
  new_image = File.open('public/assests/images/' + image_name, "wb") do |f|
    f.write(params['image'][:tempfile].read)
  end

  "<script>top.$('.mce-btn.mce-open').parent().find('.mce-textbox').val('/assests/images/#{image_name}').closest('.mce-window').find('.mce-primary').click();</script>"
end
