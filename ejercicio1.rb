class Table
  attr_accessor :name, :day1, :day2, :day3, :day4, :table, :data

  def initialize(name, day1, day2, day3, day4)
    @name = name
    @day1 = day1.to_i
    @day2 = day2.to_i
    @day3 = day3.to_i
    @day4 = day4.to_i
  end
  # Crear un metodo que permita leer el archivo e instanciar un objeto de
  # la clase Table por cada linea del archivo.

  def self.read
    data = []
    table = []
    File.open('casino.txt', 'r') { |file| data = file.readlines }
    data.each do |line|
      pertable = line.split(', ').map(&:chomp)
      table << Table.new(*pertable)
    end
    table
  end

  # Conocer el mayor valor recaudado, por mesa, y el nombre de la mesa y dia
  # corresponde (dia 1, dia 2, dia 3 o dia 4).

  def self.highest
    a = self.read
    p a
    sales = {}
    a.each do |mesa|
      sales = { dia1: mesa.day1, dia2: mesa.day2, dia3: mesa.day3, dia4: mesa.day4 }
      largest = sales.max_by { |k, v| v }
      puts "La #{mesa.name} recaudo  más el #{largest.first}"
    end
  end

  # Calcular el prom total de lo recaudado por todas las mesas en todos los dias.
  def self.average
    b = self.read
    rec = 0
    b.each do |mesa|
      rec += mesa.day1 + mesa.day2 + mesa.day3 + mesa.day3
    end
    p rec / 4
  end
end
Table.highest
Table.average
