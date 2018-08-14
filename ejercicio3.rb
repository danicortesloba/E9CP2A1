# Crear una clase llamada Roulette.
class Roulette
  attr_accessor :r, :number, :local_number, :winner_numbers
  def initialize
    @r = r
    @number = number
    @local_number = local_number
    @winner_numbers = winner_numbers
  end
end
# Crear un metodo de instancia llamado play que reciba como argumento un numero
# al cual se esta apostando. Luego debe tomar un valor -del array- al azar y
# compararlo con el numero al cual se aposto.
def play
  p '¿A qué numero del 1 al 10 quieres apostar?'
  Roulette.new
  r = (1..10).to_a
  @number = gets.chomp.to_i
  @local_number = r.sample.to_i
  if @number == @local_number then
    puts '¡Ganaste!'
  else
    puts 'Perdiste :('
  end
 @local_number
end

# Crear un metodo de instancia que:
# Debe almacenar el numero generado al azar
# en un archivo llamado roulette_history.txt
# Si el numero al cual se aposto corresponde al generado al azar entonces,
# debe ademas almacenar ese numero en un archivo llamado winners.txt

def save
play
p @local_number
file = File.open('roulette_history.txt', 'a')
file.puts @local_number
if @local_number == @number then
  file = File.open('winners.txt', 'a')
  file.puts @local_number
end
end

# Crear un metodo que lea el archivo rouletter_history.txt y retorne el
# valor que mas ha generado la ruleta historicamente.
def biggest
save
winner = []
file = File.open('roulette_history.txt', 'r')
winner = file.readlines.map(&:chomp)
file.close
@winner_numbers = winner.map{|i| i.to_i}
@winner_numbers
end

def mode
  biggest
  counter = Hash.new(0)
  @winner_numbers.each do |i|
  counter[i] += 1
  end
  mode_array = []
  counter.each do |k, v|
    if v == counter.values.max
      mode_array << k
    end
  end
  mode_array.sort
  p mode_array
end

mode
