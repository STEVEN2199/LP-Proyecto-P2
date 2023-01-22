require 'open-uri' # consultar a la plataforma
require 'nokogiri' # formatear, parsear a html
require 'csv' # escribir y leer csv
load 'Instrumentos.rb'
load 'Audio.rb'
load 'Iluminacion.rb'
load 'EstudioGrabacion.rb'
load 'Tecnologia.rb'

arr_prom_total_audio = []
arr_audio_top3 = []
arr_audio_top3_nombre = []

arr_prom_total_iluminacion = []
arr_iluminacion_top3 = []
arr_iluminacion_top3_nombre = []

arr_prom_total_grabacion = []
arr_grabacion_top3 = []
arr_grabacion_top3_nombre = []

arr_prom_total_instrumentos = []
arr_instrumentos_top3 = []
arr_instrumentos_top3_nombre = []

arr_prom_total_tecnologia = []
arr_tecnologia_top3 = []
arr_tecnologia_top3_nombre = []

link = 'https://eckomusic.com/categoria-producto/instrumentos-musicales/?orderby=popularity'
count1 = 0
eckomusicHTML = URI.open(link)
datos = eckomusicHTML.read
# puts datos
parsed_content = Nokogiri::HTML(datos)

elements_container = parsed_content.css('.products')
elements_container.css('.sales-flash-overlay').each do |item_post|
  nombre = item_post.css('.woocommerce-loop-product__title').inner_text
  puts(nombre)
  precio = item_post.css('.price').inner_text
  precio = precio[1..-1]
  puts precio
  img = item_post.css('.inside-wc-product-image').css('img').attr('src')
  puts img

  arr_prom_total_instrumentos.push(precio.to_i) unless precio.include?('$')

  next unless count1 < 1

  arr_instrumentos_top3.push(precio.to_f)
  arr_instrumentos_top3_nombre.push(nombre[0..23])
  instrumentos = Instrumentos.new(nombre, precio, img)
  instrumentos.guardar
  count1 += 1
end
################################################################
# Categoria Audio
link2 = 'https://eckomusic.com/categoria-producto/audio/?orderby=popularity'
count2 = 0
eckomusicHTML2 = URI.open(link2)
datos2 = eckomusicHTML2.read
# puts datos
parsed_content2 = Nokogiri::HTML(datos2)

elements_container2 = parsed_content2.css('.products')
elements_container2.css('.sales-flash-overlay').each do |item_post2|
  nombre2 = item_post2.css('.woocommerce-loop-product__title').inner_text
  puts(nombre2)
  precio2 = item_post2.css('.price').inner_text
  precio2 = precio2[1..-1]
  puts precio2
  img2 = item_post2.css('.inside-wc-product-image').css('img').attr('src')
  puts img2

  arr_prom_total_audio.push(precio2.to_i) unless precio2.include?('$')

  next unless count2 < 1

  arr_audio_top3.push(precio2.to_f)
  arr_audio_top3_nombre.push(nombre2[0..23])
  audio = Audio.new(nombre2, precio2, img2)
  audio.guardar
  count2 += 1
end

################################################################
# Categoria Audio
link3 = 'https://eckomusic.com/categoria-producto/iluminacion/?orderby=popularity'
count3 = 0
eckomusicHTML3 = URI.open(link3)
datos3 = eckomusicHTML3.read
# puts datos
parsed_content3 = Nokogiri::HTML(datos3)

elements_container3 = parsed_content3.css('.products')
elements_container3.css('.sales-flash-overlay').each do |item_post3|
  nombre3 = item_post3.css('.woocommerce-loop-product__title').inner_text
  puts(nombre3)
  precio3 = item_post3.css('.price').inner_text
  precio3 = precio3[1..-1]
  puts precio3
  img3 = item_post3.css('.inside-wc-product-image').css('img').attr('src')
  puts img3

  arr_prom_total_iluminacion.push(precio3.to_i) unless precio3.include?('$')

  next unless count3 < 1

  arr_iluminacion_top3.push(precio3.to_f)
  arr_iluminacion_top3_nombre.push(nombre3[0..23])
  iluminacion = Iluminacion.new(nombre3, precio3, img3)
  iluminacion.guardar
  count3 += 1
end

################################################################
# Categoria Estudio Grabacion
link4 = 'https://eckomusic.com/categoria-producto/estudio-de-grabacion/?orderby=popularity'
count4 = 0
eckomusicHTML4 = URI.open(link4)
datos4 = eckomusicHTML4.read
# puts datos
parsed_content4 = Nokogiri::HTML(datos4)

elements_container4 = parsed_content4.css('.products')
elements_container4.css('.sales-flash-overlay').each do |item_post4|
  nombre4 = item_post4.css('.woocommerce-loop-product__title').inner_text
  puts(nombre4)
  precio4 = item_post4.css('.price').inner_text
  precio4 = precio4[1..-1]
  puts precio4
  img4 = item_post4.css('.inside-wc-product-image').css('img').attr('src')
  puts img4

  arr_prom_total_grabacion.push(precio4.to_i) unless precio4.include?('$')

  next unless count4 < 1

  arr_grabacion_top3.push(precio4.to_f)
  arr_grabacion_top3_nombre.push(nombre4[0..23])
  grabacion = EstudioGrabacion.new(nombre4, precio4, img4)
  grabacion.guardar
  count4 += 1
end
################################################################
# Categoria Tecnologia
link5 = 'https://eckomusic.com/categoria-producto/tecnologia/?orderby=popularity'
count5 = 0
eckomusicHTML5 = URI.open(link5)
datos5 = eckomusicHTML5.read
# puts datos
parsed_content5 = Nokogiri::HTML(datos5)

elements_container5 = parsed_content5.css('.products')
elements_container5.css('.sales-flash-overlay').each do |item_post5|
  nombre5 = item_post5.css('.woocommerce-loop-product__title').inner_text
  puts(nombre5)
  precio5 = item_post5.css('.price').inner_text
  precio5 = precio5[1..-1]
  puts precio5
  img5 = item_post5.css('.inside-wc-product-image').css('img').attr('src')
  puts img5

  arr_prom_total_tecnologia.push(precio5.to_i) unless precio5.include?('$')

  next unless count5 < 1

  arr_tecnologia_top3.push(precio5.to_f)
  arr_tecnologia_top3_nombre.push(nombre5[0..23])
  tecnologia = Tecnologia.new(nombre5, precio5, img5)
  tecnologia.guardar
  count5 += 1
end
arr_total_top3 = arr_audio_top3 + arr_iluminacion_top3 + arr_tecnologia_top3 + arr_grabacion_top3 + arr_instrumentos_top3

arr_total_top3_nombres = arr_audio_top3_nombre + arr_iluminacion_top3_nombre + arr_tecnologia_top3_nombre + arr_grabacion_top3_nombre + arr_instrumentos_top3_nombre

arr_total_top3_ordenado = arr_total_top3.sort
puts arr_total_top3_ordenado
arr_total_top3_nombres_ordenado = []
indice = arr_total_top3_nombres.length
(0..indice - 1).each do |i|
  (0..indice - 1).each do |j|
    arr_total_top3_nombres_ordenado[j] = arr_total_top3_nombres[i] if arr_total_top3[i] == arr_total_top3_ordenado[j]
  end
end

(0..indice - 1).each do |i|
  CSV.open('top3categorias.csv', 'a') do |csv|
    # csv << %w[Nombre Precio Img]
    csv << [arr_total_top3_nombres_ordenado[i].to_s, arr_total_top3_ordenado[i].to_f]
  end
end

puts arr_total_top3_nombres_ordenado
puts arr_total_top3_ordenado

prom_tecnologia = arr_prom_total_tecnologia.sum / arr_prom_total_tecnologia.length

prom_audio = arr_prom_total_audio.sum / arr_prom_total_audio.length

prom_grabacion = arr_prom_total_grabacion.sum / arr_prom_total_grabacion.length

prom_instrumentos = arr_prom_total_instrumentos.sum / arr_prom_total_instrumentos.length

prom_iluminacion = arr_prom_total_iluminacion.sum / arr_prom_total_iluminacion.length

arr_promedios_totales = [prom_tecnologia, prom_audio, prom_grabacion, prom_instrumentos, prom_iluminacion]

arr_categorias = ['Tecnologia', 'Audio', 'Estudio Grabacion', 'Instrumentos', 'Iluminacion']

indice2 = arr_promedios_totales.length
(0..indice2 - 1).each do |i|
  CSV.open('promediosCategorias.csv', 'a') do |csv|
    csv << [arr_categorias[i].to_s, arr_promedios_totales[i].to_i]
  end
end
