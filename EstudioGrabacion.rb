class EstudioGrabacion
  # Getters, Setters
  attr_accessor :nombre, :precio, :img

  def initialize(_nombre, _precio, _img)
    @nombre = _nombre
    @precio = _precio
    @img = _img
  end

  # Funcion guardar en el archivo movies.csv
  def guardar
    CSV.open('estGrabacion.csv', 'a') do |csv|
      # csv << %w[Nombre Precio Img]
      csv << [@nombre.to_s, @precio.to_s, @img.to_s]
    end
  end
end
