require 'open-uri' # consultar a la plataforma
require 'nokogiri' # formatear, parsear a html
require 'csv' # escribir y leer csv
load 'Instrumentos.rb'
load 'Audio.rb'
load 'Iluminacion.rb'
load 'EstudioGrabacion.rb'
load 'Tecnologia.rb'

# ###############Arreglos para guardar informacion################
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

arr_total_precios_tecnologia = []
arr_total_nombre_tecnologia = []

arr_total_precios_audio = []
arr_total_nombre_audio = []

arr_total_precios_instrumentos = []
arr_total_nombre_instrumentos = []

arr_total_precios_iluminacion = []
arr_total_nombre_iluminacion = []

arr_total_precios_grabacion = []
arr_total_nombre_grabacion = []

arr_links_audio = []
arr_links_tecnologia = []
arr_links_iluminacion = []
arr_links_grabacion = []
arr_links_instrumentos = []
# ###############Arreglos para guardar informacion################

################################################################
# Categoria Instrumentos
link = 'https://eckomusic.com/categoria-producto/instrumentos-musicales/?orderby=popularity'
count1 = 0
eckomusicHTML = URI.open(link)
datos = eckomusicHTML.read
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
  linkProduct = item_post.css('a').attr('href')
  puts linkProduct

  arr_links_instrumentos.push(linkProduct)

  arr_prom_total_instrumentos.push(precio.to_i) unless precio.include?('$')

  unless precio.include?('$')
    arr_total_precios_instrumentos.push(precio.to_f)
    arr_total_nombre_instrumentos.push(nombre[0..23])
  end

  next unless count1 < 1

  arr_instrumentos_top3.push(precio.to_f)
  arr_instrumentos_top3_nombre.push(nombre[0..23])
  instrumentos = Instrumentos.new(nombre, precio, img)
  # instrumentos.guardar
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
  linkProduct2 = item_post2.css('a').attr('href')
  puts linkProduct2
  arr_links_audio.push(linkProduct2)

  arr_prom_total_audio.push(precio2.to_i) unless precio2.include?('$')

  unless precio2.include?('$')
    arr_total_precios_audio.push(precio2.to_f)
    arr_total_nombre_audio.push(nombre2[0..23])
  end

  next unless count2 < 1

  arr_audio_top3.push(precio2.to_f)
  arr_audio_top3_nombre.push(nombre2[0..23])
  audio = Audio.new(nombre2, precio2, img2)
  # audio.guardar
  count2 += 1
end

################################################################
# Categoria Iluminacion
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
  linkProduct3 = item_post3.css('a').attr('href')
  puts linkProduct3
  arr_links_iluminacion.push(linkProduct3)

  arr_prom_total_iluminacion.push(precio3.to_i) unless precio3.include?('$')

  unless precio3.include?('$')
    arr_total_precios_iluminacion.push(precio3.to_f)
    arr_total_nombre_iluminacion.push(nombre3[0..23])
  end

  next unless count3 < 1

  arr_iluminacion_top3.push(precio3.to_f)
  arr_iluminacion_top3_nombre.push(nombre3[0..23])
  iluminacion = Iluminacion.new(nombre3, precio3, img3)
  # iluminacion.guardar
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
  linkProduct4 = item_post4.css('a').attr('href')
  puts linkProduct4
  arr_links_grabacion.push(linkProduct4)

  arr_prom_total_grabacion.push(precio4.to_i) unless precio4.include?('$')

  unless precio4.include?('$')
    arr_total_precios_grabacion.push(precio4.to_f)
    arr_total_nombre_grabacion.push(nombre4[0..23])
  end

  next unless count4 < 1

  arr_grabacion_top3.push(precio4.to_f)
  arr_grabacion_top3_nombre.push(nombre4[0..23])
  grabacion = EstudioGrabacion.new(nombre4, precio4, img4)
  # grabacion.guardar
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
  linkProduct5 = item_post5.css('a').attr('href')
  puts linkProduct5
  arr_links_tecnologia.push(linkProduct5)

  arr_prom_total_tecnologia.push(precio5.to_i) unless precio5.include?('$')

  unless precio5.include?('$')
    arr_total_precios_tecnologia.push(precio5.to_f)
    arr_total_nombre_tecnologia.push(nombre5[0..23])
  end

  next unless count5 < 1

  arr_tecnologia_top3.push(precio5.to_f)
  arr_tecnologia_top3_nombre.push(nombre5[0..23])
  tecnologia = Tecnologia.new(nombre5, precio5, img5)
  # tecnologia.guardar
  count5 += 1
end

# ##############Arreglo De Los Top De Cada Categoria#######################
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
  CSV.open('topCategorias.csv', 'a') do |csv|
    # csv << %w[Nombre Precio Img]
    csv << [arr_total_top3_nombres_ordenado[i].to_s, arr_total_top3_ordenado[i].to_f]
  end
end
# ##############Arreglo De Los Top De Cada Categoria#######################
# puts arr_total_top3_nombres_ordenado
# puts arr_total_top3_ordenado

# #####################Promedios Para Pie Chart#########################
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
# #####################Promedios Para Pie Chart#########################

# #####################Ordenar Elementos#########################
arr_total_precios_tecnologia_ordenado = arr_total_precios_tecnologia.sort
arr_total_nombre_tecnologia_ordenado = []
indiceTecnlogia = arr_total_nombre_tecnologia.length
(0..indiceTecnlogia - 1).each do |i|
  (0..indiceTecnlogia - 1).each do |j|
    if arr_total_precios_tecnologia[i] == arr_total_precios_tecnologia_ordenado[j]
      arr_total_nombre_tecnologia_ordenado[j] = arr_total_nombre_tecnologia[i]
    end
  end
end

arr_total_precios_audio_ordenado = arr_total_precios_audio.sort
arr_total_nombre_audio_ordenado = []
indiceAudio = arr_total_nombre_audio.length
(0..indiceAudio - 1).each do |i|
  (0..indiceAudio - 1).each do |j|
    if arr_total_precios_audio[i] == arr_total_precios_audio_ordenado[j]
      arr_total_nombre_audio_ordenado[j] = arr_total_nombre_audio[i]
    end
  end
end

arr_total_precios_instrumentos_ordenado = arr_total_precios_instrumentos.sort
arr_total_nombre_instrumentos_ordenado = []
indiceInstrumentos = arr_total_nombre_instrumentos.length
(0..indiceInstrumentos - 1).each do |i|
  (0..indiceInstrumentos - 1).each do |j|
    if arr_total_precios_instrumentos[i] == arr_total_precios_instrumentos_ordenado[j]
      arr_total_nombre_instrumentos_ordenado[j] = arr_total_nombre_instrumentos[i]
    end
  end
end

arr_total_precios_grabacion_ordenado = arr_total_precios_grabacion.sort
arr_total_nombre_grabacion_ordenado = []
indiceGrabacion = arr_total_nombre_grabacion.length
(0..indiceGrabacion - 1).each do |i|
  (0..indiceGrabacion - 1).each do |j|
    if arr_total_precios_grabacion[i] == arr_total_precios_grabacion_ordenado[j]
      arr_total_nombre_grabacion_ordenado[j] = arr_total_nombre_grabacion[i]
    end
  end
end

arr_total_precios_iluminacion_ordenado = arr_total_precios_iluminacion.sort
arr_total_nombre_iluminacion_ordenado = []
indiceIluminacion = arr_total_nombre_iluminacion.length
(0..indiceIluminacion - 1).each do |i|
  (0..indiceIluminacion - 1).each do |j|
    if arr_total_precios_iluminacion[i] == arr_total_precios_iluminacion_ordenado[j]
      arr_total_nombre_iluminacion_ordenado[j] = arr_total_nombre_iluminacion[i]
    end
  end
end
# #####################Ordenar Elementos#########################

# #####################Arreglos Para Bar Chart#########################
puts 'steven'
arr_union_iluminacion_precio = []
arr_union_iluminacion_precio.push(arr_total_precios_iluminacion_ordenado[0])
arr_union_iluminacion_precio.push(arr_total_precios_iluminacion_ordenado[-1])
arr_union_iluminacion_nombre = []
arr_union_iluminacion_nombre.push(arr_total_nombre_iluminacion_ordenado[0])
arr_union_iluminacion_nombre.push(arr_total_nombre_iluminacion_ordenado[-1])
arr_union_iluminacion_categoria = []
arr_union_iluminacion_categoria.push('iluminacion')
arr_union_iluminacion_categoria.push('iluminacion')

# /*----------------------------------------------------*/
puts 'scarlet'
arr_union_audio_precio = []
arr_union_audio_precio.push(arr_total_precios_audio_ordenado[0])
arr_union_audio_precio.push(arr_total_precios_audio_ordenado[-1])
arr_union_audio_nombre = []
arr_union_audio_nombre.push(arr_total_nombre_audio_ordenado[0])
arr_union_audio_nombre.push(arr_total_nombre_audio_ordenado[-1])
arr_union_audio_categoria = []
arr_union_audio_categoria.push('audio')
arr_union_audio_categoria.push('audio')
# /*----------------------------------------------------*/
puts 'juan'
arr_union_tecnologia_precio = []
arr_union_tecnologia_precio.push(arr_total_precios_tecnologia_ordenado[0])
arr_union_tecnologia_precio.push(arr_total_precios_tecnologia_ordenado[-1])
arr_union_tecnologia_nombre = []
arr_union_tecnologia_nombre.push(arr_total_nombre_tecnologia_ordenado[0])
arr_union_tecnologia_nombre.push(arr_total_nombre_tecnologia_ordenado[-1])
arr_union_tecnologia_categoria = []
arr_union_tecnologia_categoria.push('tecnologia')
arr_union_tecnologia_categoria.push('tecnologia')
# /*----------------------------------------------------*/
puts 'davis'
arr_union_grabacion_precio = []
arr_union_grabacion_precio.push(arr_total_precios_grabacion_ordenado[0])
arr_union_grabacion_precio.push(arr_total_precios_grabacion_ordenado[-1])
arr_union_grabacion_nombre = []
arr_union_grabacion_nombre.push(arr_total_nombre_grabacion_ordenado[0])
arr_union_grabacion_nombre.push(arr_total_nombre_grabacion_ordenado[-1])
arr_union_grabacion_categoria = []
arr_union_grabacion_categoria.push('grabacion')
arr_union_grabacion_categoria.push('grabacion')
# /*----------------------------------------------------*/
puts 'choco'
arr_union_instrumentos_precio = []
arr_union_instrumentos_precio.push(arr_total_precios_instrumentos_ordenado[0])
arr_union_instrumentos_precio.push(arr_total_precios_instrumentos_ordenado[-1])
arr_union_instrumentos_nombre = []
arr_union_instrumentos_nombre.push(arr_total_nombre_instrumentos_ordenado[0])
arr_union_instrumentos_nombre.push(arr_total_nombre_instrumentos_ordenado[-1])
arr_union_instrumentos_categoria = []
arr_union_instrumentos_categoria.push('instrumentos')
arr_union_instrumentos_categoria.push('instrumentos')

arr_total_categorias_cb_precios = arr_union_iluminacion_precio + arr_union_audio_precio + arr_union_tecnologia_precio + arr_union_grabacion_precio + arr_union_instrumentos_precio

puts 'separacion'
puts arr_total_categorias_cb_precios

arr_total_categorias_cb_nombres = arr_union_iluminacion_nombre + arr_union_audio_nombre + arr_union_tecnologia_nombre + arr_union_grabacion_nombre + arr_union_instrumentos_nombre

puts arr_total_categorias_cb_nombres

arr_total_categorias_cb_categorias = arr_union_iluminacion_categoria + arr_union_audio_categoria + arr_union_tecnologia_categoria + arr_union_grabacion_categoria + arr_union_instrumentos_categoria
# #####################Arreglos Para Bar Chart#########################

# ###############Ordena Arreglos De Menor A Mayor #####################
arr_total_categorias_cb_precios_ordenado = arr_total_categorias_cb_precios.sort
arr_total_categorias_cb_nombres_ordenado = []
arr_total_categorias_cb_categorias_ordenado = []
indiceFinal = arr_total_categorias_cb_precios.length
(0..indiceFinal - 1).each do |i|
  (0..indiceFinal - 1).each do |j|
    next unless arr_total_categorias_cb_precios[i] == arr_total_categorias_cb_precios_ordenado[j]

    arr_total_categorias_cb_nombres_ordenado[j] = arr_total_categorias_cb_nombres[i]
    arr_total_categorias_cb_categorias_ordenado[j] = arr_total_categorias_cb_categorias[i]
  end
end

puts arr_total_categorias_cb_categorias_ordenado
puts arr_total_categorias_cb_precios_ordenado
puts arr_total_categorias_cb_nombres_ordenado

indiceCB = arr_total_categorias_cb_categorias_ordenado.length
(0..indiceCB - 1).each do |i|
  CSV.open('productosCarosBaratos.csv', 'a') do |csv|
    csv << [arr_total_categorias_cb_nombres_ordenado[i].to_s, arr_total_categorias_cb_precios_ordenado[i].to_f, arr_total_categorias_cb_categorias_ordenado[i].to_s]
  end
end
# ###############Ordena Arreglos De Menor A Mayor #####################

# ###############Ordena Arreglos De 3 En 3#############################
arr_final_nombres = []
arr_final_nombres.push(arr_total_nombre_iluminacion_ordenado[0])
arr_final_nombres.push(arr_total_nombre_audio_ordenado[0])
arr_final_nombres.push(arr_total_nombre_tecnologia_ordenado[0])
arr_final_nombres.push(arr_total_nombre_grabacion_ordenado[0])
arr_final_nombres.push(arr_total_nombre_instrumentos_ordenado[0])

arr_final_nombres.push(arr_total_nombre_iluminacion_ordenado[-1])
arr_final_nombres.push(arr_total_nombre_audio_ordenado[-1])
arr_final_nombres.push(arr_total_nombre_tecnologia_ordenado[-1])
arr_final_nombres.push(arr_total_nombre_grabacion_ordenado[-1])
arr_final_nombres.push(arr_total_nombre_instrumentos_ordenado[-1])

arr_final_precios = []
arr_final_precios.push(arr_total_precios_iluminacion_ordenado[0])
arr_final_precios.push(arr_total_precios_audio_ordenado[0])
arr_final_precios.push(arr_total_precios_tecnologia_ordenado[0])
arr_final_precios.push(arr_total_precios_grabacion_ordenado[0])
arr_final_precios.push(arr_total_precios_instrumentos_ordenado[0])

arr_final_precios.push(arr_total_precios_iluminacion_ordenado[-1])
arr_final_precios.push(arr_total_precios_audio_ordenado[-1])
arr_final_precios.push(arr_total_precios_tecnologia_ordenado[-1])
arr_final_precios.push(arr_total_precios_grabacion_ordenado[-1])
arr_final_precios.push(arr_total_precios_instrumentos_ordenado[-1])

arr_final_categoria = []
arr_final_categoria.push('iluminacion')
arr_final_categoria.push('audio')
arr_final_categoria.push('tecnologia')
arr_final_categoria.push('grabacion')
arr_final_categoria.push('instrumentos')

arr_final_categoria.push('iluminacion')
arr_final_categoria.push('audio')
arr_final_categoria.push('tecnologia')
arr_final_categoria.push('grabacion')
arr_final_categoria.push('instrumentos')

indiceFinal = arr_final_precios.length
(0..indiceFinal - 1).each do |i|
  CSV.open('productosCarosBaratos2.csv', 'a') do |csv|
    csv << [arr_final_nombres[i].to_s, arr_final_precios[i].to_f, arr_final_categoria[i].to_s]
  end
end
# ###############Ordena Arreglos De 3 En 3#############################

#######################################################################
# ##########################Stock Audio#################################
arr_stock_audio = []
indiceLink1 = arr_links_audio.length
(0..indiceLink1 - 1).each do |i|
  linkAudio = (arr_links_audio[i]).to_s
  eckomusicLinkAudio = URI.open(linkAudio)
  datosAudio = eckomusicLinkAudio.read
  parsed_audio = Nokogiri::HTML(datosAudio)
  elements_audio = parsed_audio.css('.elementor-container').css('.stock').inner_text
  arr_elements_audio = elements_audio.split
  arr_stock_audio.push((arr_elements_audio[0]).to_i)
end
# puts arr_stock_audio

# ##########################Stock Iluminacion#################################
arr_stock_iluminacion = []
indiceLink2 = arr_links_iluminacion.length
(0..indiceLink2 - 1).each do |i|
  linkIluminacion = arr_links_iluminacion[i].to_s
  eckomusicLinkIluminacion = URI.open(linkIluminacion)
  datosIluminacion = eckomusicLinkIluminacion.read
  parsed_iluminacion = Nokogiri::HTML(datosIluminacion)
  elements_iluminacion = parsed_iluminacion.css('.elementor-container').css('.stock').inner_text
  arr_elements_iluminacion = elements_iluminacion.split
  arr_stock_iluminacion.push((arr_elements_iluminacion[0]).to_i)
end
# puts arr_stock_iluminacion

# ##########################Stock Grabacion#################################
arr_stock_grabacion = []
indiceLink3 = arr_links_grabacion.length
(0..indiceLink3 - 1).each do |i|
  linkGrabacion = arr_links_grabacion[i].to_s
  eckomusicLinkGrabacion = URI.open(linkGrabacion)
  datosGrabacion = eckomusicLinkGrabacion.read
  parsed_grabacion = Nokogiri::HTML(datosGrabacion)
  elements_grabacion = parsed_grabacion.css('.elementor-container').css('.stock').inner_text
  arr_elements_grabacion = elements_grabacion.split
  arr_stock_grabacion.push((arr_elements_grabacion[0]).to_i)
end
# puts arr_stock_grabacion

# ##########################Stock Tecnologia#################################
arr_stock_tecnologia = []
indiceLink4 = arr_links_tecnologia.length
(0..indiceLink4 - 1).each do |i|
  linkTecnologia = arr_links_tecnologia[i].to_s
  eckomusicLinkTecnologia = URI.open(linkTecnologia)
  datosTecnologia = eckomusicLinkTecnologia.read
  parsed_tecnologia = Nokogiri::HTML(datosTecnologia)
  elements_tecnologia = parsed_tecnologia.css('.elementor-container').css('.stock').inner_text
  arr_elements_tecnologia = elements_tecnologia.split
  arr_stock_tecnologia.push((arr_elements_tecnologia[0]).to_i)
end
# puts arr_stock_tecnologia

# ##########################Stock Instrumentos#################################
arr_stock_instrumentos = []
indiceLink5 = arr_links_instrumentos.length
(0..indiceLink5 - 1).each do |i|
  linkInstrumentos = arr_links_instrumentos[i].to_s
  eckomusicLinkInstrumentos = URI.open(linkInstrumentos)
  datosInstrumentos = eckomusicLinkInstrumentos.read
  parsed_instrumentos = Nokogiri::HTML(datosInstrumentos)
  elements_instrumentos = parsed_instrumentos.css('.elementor-container').css('.stock').inner_text
  arr_elements_instrumentos = elements_instrumentos.split
  arr_stock_instrumentos.push((arr_elements_instrumentos[0]).to_i)
end
# puts arr_stock_instrumentos
arr_stock_audio_total = arr_stock_audio.sum
arr_stock_iluminacion_total = arr_stock_iluminacion.sum
arr_stock_grabacion_total = arr_stock_grabacion.sum
arr_stock_tecnologia_total = arr_stock_tecnologia.sum
arr_stock_instrumentos_total = arr_stock_instrumentos.sum

arr_stock_total = []

arr_stock_total.push(arr_stock_audio_total)
arr_stock_total.push(arr_stock_iluminacion_total)
arr_stock_total.push(arr_stock_grabacion_total)
arr_stock_total.push(arr_stock_tecnologia_total)
arr_stock_total.push(arr_stock_instrumentos_total)
# puts arr_stock_total
indiceStock = arr_stock_total.length
categoriasStock = %w[Audio Iluminacion Grabacion Tecnologia Instrumentos]
(0..indiceStock - 1).each do |i|
  CSV.open('productosStock.csv', 'a') do |csv|
    csv << [categoriasStock[i].to_s,arr_stock_total[i].to_i]
  end
end
