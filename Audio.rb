class Audio
  # Getters, Setters
  attr_accessor :nombre, :precio, :img

  def initialize(_nombre, _precio, _img)
    @nombre = _nombre
    @precio = _precio
    @img = _img
  end

  # funcion top 3
  def top3
    arr_all = arrElementosAudio
    arr_audio = []
    arr_all.each do |e|
      arr_audio.push(e) if arr_audio.length < 4
    end
  end

  def arrElementosAudio
    arr_all_audio = []
    arr_all_audio.push(@precio)
  end

  # Funcion guardar en el archivo audio.csv
  def guardar
    CSV.open('audio.csv', 'a') do |csv|
      # csv << %w[Nombre Precio Img]
      csv << [@nombre.to_s, @precio.to_s, @img.to_s]
    end
  end
end
