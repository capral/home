class Train # Класс Train (поезд):

attr_reader :number, :type, :vagons, :speed 

  def initialize (number, type, vagons)
    @number = number # Имеет номер (указывается при создании и не меняется в течение жизни объекта) 
    @type = type # Имеет, тип, который указывается при создании: грузовой, пассажирский (строки или символы)
    @vagons = vagons # Имеет кол-во вагонов, которое также указывается при создании поезда
    @speed = 0
  end
 
  def hook_one #прицеплять по одному вагону, если speed == 0 
  	@vagons += 1 if vagons < 101 && speed == 0
  end
  
  def unhook_one #отцеплять по одному вагону, если speed == 0	@vagons =- 1 if speed == 0 && @vagons > 1
  	@vagons -= 1 if vagons > 1 && speed == 0
  end

  def speed_up
  	@speed += 10 if speed < 110	 # увеличивать значение скорости на 10 при каждом вызове, не более 110)
  end

  def speed_down
    @speed -= 10 if @speed >= 10 # тормозить (уменьшать значение скорости на 10, но скорость не ниже 0)
  end
end

class Station #Класс Станция

attr_reader :name, :trains

def initialize (name)
	@name = name #Имеет название, которое указывается при ее создании
	@trains = trains #Может выводить на экран список всех поездов на станции
end

def train_in  #Может принимать поезда (передается объект поезда и сохраняется во списке станции)
end

def train_out #Может отправлять поезда (при этом, поезд удаляется из списка поездов на станции).
end	




