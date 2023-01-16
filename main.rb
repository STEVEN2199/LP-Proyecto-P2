puts "Mi Primer Scraper de Películas \u{1f3ac}"

require 'open-uri' # consultar a la plataforma
require 'nokogiri' # formatear, parsear a html
require 'csv' # escribir y leer csv
load 'Instrumentos.rb'

link = 'https://eckomusic.com/categoria-producto/instrumentos-musicales/?orderby=popularity'
i = 0
eckomusicHTML = URI.open(link)
datos = eckomusicHTML.read
# puts datos
parsed_content = Nokogiri::HTML(datos) # si pasa es porque la pagina si sigue estandares

elements_container = parsed_content.css('.products')
# puts movies_container
elements_container.css('.sales-flash-overlay').each do |item_post|
  # puts movie_post
  nombre = item_post.css('.woocommerce-loop-product__title').inner_text
  puts(nombre)
  precio = item_post.css('.price').inner_text
  puts precio
  img = item_post.css('.inside-wc-product-image').css('img').attr('src')
  puts img

  instrumentos = Instrumentos.new(nombre, precio, img)
  instrumentos.guardar
end
