# Класс Station:
# Может выводить на экран список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# Создать класс Route (маршрут), который:
# Имеет начальную и конечную станцию (объекты Station), которые задаются при создании
# Имеют список промежуточных станций
# Может добавлять станцию в список
# Может удалять станцию из списка
# Может выводить список всех станций по-порядку от начальной до конечной
# Класс Train может:
# Принимать маршрут следования (объект класса Route)
# Перемещаться между станциями, указанными в маршруте.
# Показывать текущую, следующую, и предыдущую станции на основе маршрута (3 разных метода). 
# Учесть, что поезд не может перемещаться дальше начальной и конечной станций.


class Train

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

class Station

attr_reader :name, :list

  def initialize (name)
  @name = name #Имеет название, которое указывается при ее создании
  @list = [] 
  end

  def add_list (train)  #Может принимать поезда (передается объект поезда и сохраняется в списке станции)
  @list << train
  #train_current_station = self.train

  end

  def delete_list (train) #Может отправлять поезда (при этом, поезд удаляется из списка поездов на станции).
  @list.delete(train)
  end

def print_list
  @list.each {|train| puts train.number} #вернёт номера поездов на станции без 'end'

end

class Route
  sttr_reader: 1_station, lsast_stations, lsast_stations

  def initialize(first_station, last_station)
    @first_station = first
    @last_station = last
    @stop = []
    @stations = [first_station, @stops, @last_station]

#три метода ,кажый из которых возвращает предыдущую станцию, текущую и следующую

arr.insert[-2,4]  
#50-ая минута урока 
    
  end