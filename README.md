# Editor
TinyMCE + Sinatra + image_upload plugin example.

Простой работающий пример загрузки изображений 
с использованием [Sinatra](http://www.sinatrarb.com/) и [TinyMCE](https://www.tinymce.com/) (v 4.3.2)

При сохранении файлу добавляется приставка текущего времени в Unix формате
```ruby
image_name = Time.now.to_i.to_s + "_" + params['image'][:filename]
```

Место загрузки (необходимы права для записи в нужную директорию)
```ruby
new_image = File.open('public/assests/images/' + image_name, "wb") do |f|
    f.write(params['image'][:tempfile].read)
end
```
Нерабочий код был найден на просторах интернетов и отремонтирован.
