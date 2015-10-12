# encoding utf-8
require_relative 'train'
require_relative 'station2'
require_relative 'route'
require_relative 'cargo_train'
require_relative 'pass_train'
require_relative 'cargo_wagon'
require_relative 'pass_wagon'

puts "Добро пожаловать!"
puts "Введите название объекта station:"
station = gets.chomp
puts "Введите аргумент name для объекта station:"
name = gets.chomp
station1 = Station.new(name)
puts "Вы создали станцию #{station}"
puts "Список всех станций класса Station: #{Station.all_stations}"

puts "Введите название следующего объекта station:"
station = gets.chomp
puts "Введите аргумент name для объекта station:"
name = gets.chomp
station2 = Station.new(name)
puts "Вы создали станцию 
#{station}"
puts "Список всех станций класса Station: #{Station.all_stations}"

puts "Введите название маршрута:"
route66 = gets.strip
route = Route.new(station1,station2)
puts "Маршрут #{route66} #{route.route_list} создан. "

puts "Теперь создадим ещё несколько станций для маршрута #{route66}"
 loop do
   puts "По завершению наберите 'next'"
   puts "Введите название объекта station:"
   station = gets.chomp
 break if station == "next"
   puts "Введите аргумент name для объекта station:"
   name = gets.chomp
   station = Station.new(name)
   puts "Вы создали станцию #{station}"
   puts "Список всех станций класса Station: #{Station.all_stations}"
   route.add_station(station)
   puts "Станция #{station} добавлена в маршрут #{route.route_list}"
end

puts "Теперь создадим пассажирский или товарный поезд:"
puts "Ведите название объекта поезда:"
train_object = gets.strip
puts "Введите произвольный номер поезда в формате XXX-XX:"
number = gets.strip
puts "1.Пассажирский"
puts "2.Товарный"

i = gets.strip.to_i

case i  
  when 1
    train = PassengerTrain.new(number)
    loop do
      puts "Формируем пассажирский состав, по окончании наберите команду 'next'"
      puts "Вводите порядковый номер вагона и нажимайте 'ENTER', чтобы начать прицеплять вагоны по одному"
      passengerwagon = gets.chomp
      break if passengerwagon == "next"
      passengerwagon = PassengerWagon.new
      train.hook_one(passengerwagon)
      puts "#{train.wagons}"
    end
  when 2
    train = CargoTrain.new(number)
    loop do
      puts "Формируем товарный состав, по окончании наберите команду 'next'"
      puts "Нажимайте 'ENTER', чтобы начать прицеплять вагоны по одному"
      cargowagon = gets.chomp
      break if cargowagon == "next"
      cargowagon = CargoWagon.new
      train.hook_one(cargowagon)
      puts "#{train.wagons}"
    end
  else puts "Неверный ввод"
end

  puts "Поезд #{train_object} номер #{train.number} готов: #{train}"

train.add_route(route)
 puts "Поезд #{train_object} номер #{train.number} принял маршрут следования #{station1.name} - #{station2.name} "
 puts "Поезд находится на станции #{train.current_stop} и готов к отправке"

 
 loop do
puts "___________________"
puts "МЕНЮ УПРАВЛЕНИЯ:"
puts "1.Прибытие поезда на следующую станцию маршрута"
puts "2.Возврат на предыдущую станцию маршрута"
puts "3.Ускорение на 10 км/ч"
puts "4.Замедление на 10 км/ч"
puts "___________________"
puts "ПАССАЖИРСКИЙ ПОЕЗД:"
puts "5.Посадка пассажиров в пассажирский поезд"
puts "6.Высадка пассажиров из пассажирского"
puts "7.Прицепить пассажирские вагоны"
puts "8.Отцепить пассажирские вагоны"
puts "___________________"
puts "ТОВАРНЫЙ ПОЕЗД:"
puts "9.Загрузка товарного состава"
puts "10.Разгрузка товарного состав"
puts "11.Прицепить товарные вагоны"
puts "12.Отцепить товарные вагоны"

w = gets.strip.to_i
break if w == "next"
 case w
  when 1
    train.forward_move
    puts "Следующая станция: #{train.show_next}"
    puts "Поезд на станции: #{train.current_stop}"
    puts "Предыдущая станция: #{train.show_previous}"
  when 2
    train.reverse_move
    puts "Следующая станция: #{train.show_next}"
    puts "Поезд на станции: #{train.current_stop}"
    puts "Предыдущая станция: #{train.show_previous}"
  when 3
    train.speed_up
    puts "Текущая скорость #{train.speed} км/ч"
  when 4 
    train.speed_down
    puts "Текущая скорость #{train.speed} км/ч"
  when 5
    loop do
      puts "Выберите порядковый номер вагона для посадки пассажиров"
      input = gets.chomp
      break if input == "next"
      index = input.to_i 
      puts "Выбран вагон: #{train.wagons[index]}"
      train.wagons[index].take_seat
      puts "В вагоне #{train.wagons[index]}"
      puts "Осталось #{train.wagons[index].free_seats} мест"
      puts "Занято #{train.wagons[index].occupied_seats} мест"
      puts "Для завершения посадки: 'next'"
    end
      puts "Посадка на поезд завершена"
  when 6
    loop do
    puts "Выберите порядковый номер вагона для высадки пассажиров"
      input = gets.chomp
      break if input == "next"
      index = input.to_i 
      puts "Выбран вагон: #{train.wagons[index]}"
      train.wagons[index].off_seat
      puts "В вагоне #{train.wagons[index]}"
      puts "Осталось #{train.wagons[index].free_seats} мест"
      puts "Занято #{train.wagons[index].occupied_seats} мест"
      puts "Для завершения высадки: 'next'"
    end
      puts "Высадка пассажиров завершена"
   when 7
      loop do
      puts "Нажимайте 'ENTER', чтобы начать прицеплять вагоны по одному"
      passengerwagon = gets.chomp
      break if passengerwagon == "next"
      passengerwagon = PassengerWagon.new
      train.hook_one(passengerwagon)
      puts "#{train.wagons}"
    end
      puts "Вагоны пирцеплены"
   when 8
      loop do
      puts "Вводите порядковый номер вагона и нажимайте 'ENTER', чтобы отцеплять по одному вагону"
      input = gets.chomp
      break if input == "next"
      index = input.to_i
      train.unhook_one[index]
      puts "#{train.wagons}"
    end
      puts "Вагоны расцеплены"
    
  when 9
     loop do
      puts "Выберите порядковый номер вагона для загрузки:"
      input = gets.chomp
      break if input == "next"
      index = input.to_i 
      puts "Выбран вагон: #{train.wagons[index]}"
      puts "Введите количество груза не более #{train.wagons[index].empty_part} кг"
      value = gets.chomp.to_i
      train.wagons[index].loading(value)
      puts "В вагоне #{train.wagons[index]}"
      puts "Осталось #{train.wagons[index].empty_part} свободного места"
      puts "Загруженно #{train.wagons[index].loaded_part} кг груза"
      puts "Для завершения загрузки: 'next'"
    end
      puts "Загрузка завершена"
    
    when 10
     loop do
      puts "Введите порядковый номер вагона для разгрузки"
      input = gets.chomp
      break if input == "next"
      index = input.to_i 
      puts "Выбран вагон: #{train.wagons[index]}"
      puts "Загруженно #{train.wagons[index].loaded_part} кг груза"
      puts "Сколько килограмм груза нужно выгрузить?"
      load = gets.chomp.to_i
      train.wagons[index].detrain(load)
      puts "В вагоне #{train.wagons[index]}"
      puts "Вагон загружен на #{train.wagons[index].loaded_part} кг"
      puts "В вагоне #{train.wagons[index].empty_part} свободного места"
      puts "Для завершения разгрузки: 'next'"
    end
      puts "Разгрузка завершена"

    when 11
      loop do
      puts "Нажимайте 'ENTER', чтобы начать прицеплять вагоны по одному"
      cargowagon = gets.chomp
      break if cargowagon == "next"
      cargowagon = CargoWagon.new
      train.hook_one(cargowagon)
      puts "#{train.wagons}"
    end
      puts "Вагоны пирцеплены"
    
    when 12
      loop do
      puts "Нажимайте 'ENTER', чтобы отцеплять по одному вагону"
      gets.chomp
      train.unhook_one
      puts "#{train.wagons}"
    end
      puts "Вагоны расцеплены"

  else puts "Неверный ввод"
 end
end
