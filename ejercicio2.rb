# Crear una clase Course cuyo constructor reciba el nombre del curso
# y las fechas de inicio y termino.
class Course
  attr_accessor :name, :start, :finish, :init, :filter_date

  def initialize(name, start, finish)
    @name = name
    @start = start
    @finish = finish
  end
# Crear un metodo que permita leer el archivo y crear una instancia de
# la clase Course por linea del archivo.

  def self.read
    data = []
    course = []
    File.open('cursos.txt', 'r') { |file| data = file.readlines }
    data.each do |line|
      percourse = line.split(', ').map(&:chomp)
      course << Course.new(*percourse)
    end
   course
  end

  require 'date'

  def self.start
    a = self.read
    puts '¿Qué fecha de inicio necesitas?'
    init = gets.chomp
    filter_date = Date.parse(init)
    a.each do |curso|
      start_date = Date.parse(start)
      if start_date < filter_date then
       puts "#{@name} comienza antes de #{filter_date}"
      end
    end
  end

end



Course.read



# Saber que cursos comienzan previo a una fecha entregada como argumento.

# Saber que cursos finalizan posterior a una fecha entregada como argumento.

# En ambos el metodos argumento por defecto debe ser la fecha de hoy.

# Ambos metodos deben levantar una excepción si la fecha
# recibida es >= 2018-01-01.
