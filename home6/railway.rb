
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
 include List
  attr_reader :number, :type, :vagons, :speed
    # attr_writer :add_route

  def initialize (number, type, vagons)
    @number = number # Имеет номер (указывается при создании и не меняется в течение жизни объекта) 
    @type = type # Имеет, тип, который указывается при создании: грузовой, пассажирский (строки или символы)
    @vagons = vagons # Имеет кол-во вагонов, которое также указывается при создании поезда
    @speed = 0
    @route_list = []
    #@station = 0
    #@current_stop = 0
  #@route = nil
    
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

  def add_route(route) #Принимать маршрут следования (объект класса Route)
    @route_list << route 
  end

  def train_route
    @route_list
  end
  
  def current_stop
    @station.@list(@train)
  end
  # puts "Current station is #{@route_list[@station]}"
  #@list.each {|train| puts train.type.include?} #true/false 
    #@list.map{|item| item if item.type == type}.compact
  

  def forward_move #Перемещаться между станциями вперёд, указанными в маршруте.
    
  
  end

  def reverse_move #Перемещаться между станциями назад, указанными в маршруте.

    
  end


  # def Метод возвращает предыдущу, текущую и следующую станцию
       
  # end

  # private

    # def previous_stop #Метод возвращает предыдущую станцию
      
    # end

    # def current_stop #Метод возвращает текущую станцию
    # #    self.station if self.train.include?(self.station)
    #        puts "Текущая остановка на станции #{@route[@station]}"
    # #    xt_station_index = @train_route_position != @train_route.first ?  @train_route.index(@train_route_position) - 1 : @train_route.index(@train_route_position)
    # # @train_route_position = @train_route[next_station_index]
    # end

    # def next_stop #Метод возвращает слудующую станцию
      
    # end
  #end
end

module List
attr_reader :name, :list
end
class Station

include List

  def initialize (name)
  @name = name #Имеет название, которое указывается при ее создании
  @list = [] 
  end

  def add_list (train)  #Может принимать поезда (передается объект поезда и сохраняется в списке станции)
  @list << train
  end

  def delete_list (train) #Может отправлять поезда (при этом, поезд удаляется из списка поездов на станции).
  @list.delete
  end

  def type_list  #Может выводить на экран кол-во грузовых/пассажирских поездов
    #@list.map{|train| train if train.type == type}.compact
  type_list = Hash.new(0)
  @list.map { |train| type_list[train.type] = type_list[train.type] + 1 }
  # # @list.each {|train| puts train.type.include?} #true/false
  type_list
  end
end

# Создать класс Route (маршрут), который:
# Имеет начальную и конечную станцию (объекты Station), которые задаются при создании
# Имеют список промежуточных станций
# Может добавлять станцию в список
# Может удалять станцию из списка
# Может выводить список всех станций по-порядку от начальной до конечной



class Route
  attr_reader :route_list

  def initialize(start, finish)
    @route_list = []
    @route_list << start << finish  
  end
  
  def add_station(station)
    @route_list.insert(-2, station)
  end

  def del_station(station)
    @route_list.delete
  end

# class Route #маршрут
#   attr_reader :first_station, :stations, :last_station

#   def initialize(first_station, last_station)
#     @first_station = first_station
#     @last_station = last_station
#     @stops = []
#     @stations = [@first_station, @stops, @last_station]
#   end
#   def add_station(station) 
#      @stops << station #!if @stop.include?(station)
#   end

#   def delete_station(station)
#     @stops.delete
#   end

#   def print_route

# @arr = Hash.new  

# @st{ |train| stations[train.number] += 1 }


   # print_route = [@first_station.name, @stops.keep_if { |station| station.name }, @last_station.name].flatten
end

#  три метода ,кажый из которых возвращает предыдущую станцию, текущую и следующую
# arr.insert[-2,4]  
# 50-ая минута урока 
#     #.flatten
