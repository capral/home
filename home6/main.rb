# encoding utf-8
require_relative 'train'
require_relative 'station2'
require_relative 'route'
require_relative 'cargo_train'
require_relative 'pass_train'
require_relative 'cargo_wagon'
require_relative 'pass_wagon'


  attempt = 1
begin
  puts "Введите название станции:"
  name = gets.chomp
  station1 = Station.new(name)
  puts "Вы создали станцию #{station1.name}"
  puts "Список всех станций класса Station: #{Station.all_stations}"
rescue ArgumentError
  attempt += 1
  puts "Попробуйте ещё раз (попытка #{attempt}) :"
  puts "Введите два и более символов" if attempt == 3
  puts "Не балуйся!" if attempt > 3
retry 
end

  attempt = 1
begin
  puts "Введите название станции:"
  name = gets.chomp
  station2 = Station.new(name)
  puts "Вы создали станцию #{station2.name}"
  puts "Список всех станций класса Station: #{Station.all_stations}"
rescue ArgumentError
  attempt += 1
  puts "Попробуйте ещё раз (попытка #{attempt}) :"
  puts "Введите два и более символов" if attempt == 3
  puts "Не балуйся!" if attempt > 3
retry 
end

  puts "Введите название маршрута:"
  route66 = gets.strip
  route = Route.new(station1,station2)
  puts "Маршрут #{route66} #{route.route_list} создан. "

  puts "Теперь создадим ещё несколько станций для маршрута #{route66}"
loop do
    puts "Введите название станции:"
    attempt = 1
  begin
    name = gets.chomp
  break if name == "next"
    station = Station.new(name)
    puts "Вы создали станцию #{station.name}"
    puts "Список всех станций класса Station: #{Station.all_stations}"
    route.add_station(station)
    puts "Станция #{station.name} добавлена в маршрут #{route66}"
    puts "#{route.route_list}"
    puts "По завершению наберите: 'next'"
  rescue ArgumentError
    attempt += 1
    puts "Попробуйте ещё раз (попытка #{attempt}) :"
    puts "Введите два и более символов" if attempt == 3
    puts "Не балуйся!" if attempt > 3
  retry 
 end
end

  puts "Теперь создадим пассажирский или товарный поезд:"

    attempt = 1
begin
    puts "Введите произвольный номер поезда в формате XXX-XX:"
    number = gets.strip
  raise ArgumentError if number !~ /\A[\D|\d]{3}\-[\D|\d]{2}\z/
  rescue ArgumentError
    attempt += 1
    puts "Попробуйте ещё раз (попытка: #{attempt}) :"
  retry 
end

   attempt = 1
begin
    puts "1.Пассажирский"
    puts "2.Товарный"
    i = gets.strip.to_i
 case i  
  when 1
    train = PassengerTrain.new(number)
    loop do
      puts "Формируем пассажирский состав, по окончании наберите команду 'next'"
      puts "Нажимайте 'ENTER', чтобы начать прицеплять вагоны по одному"
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
      puts "Нажимайте 'ENTER', чтобы начать прицеплять вагоны по одиному"
      cargowagon = gets.chomp
      break if cargowagon == "next"
      cargowagon = CargoWagon.new
      train.hook_one(cargowagon)
      puts "#{train.wagons}"
    end  
  end
  raise ArgumentError if i > 2 || i < 1
  rescue ArgumentError
  attempt += 1
    puts "Попробуйте ещё раз (попытка: #{attempt}) :"
  retry
end

 puts "Поезд #{train} номер #{train.number} готов: #{train}"
 train.add_route(route)
 puts "Поезд #{train} номер #{train.number} принял маршрут следования #{station1.name} - #{station2.name} "
 puts "Поезд находится на станции #{train.current_stop} и готов к отправке"
 
loop do
    puts "  0. Вызвать меню: "
    w = gets.strip.to_i
  break if w == "next"

   case w

    when 0
      puts "  _______________"
      puts "  МЕНЮ УПРАВЛЕНИЯ:"
      puts "  1. Прибытие поезда на следующую станцию маршрута"
      puts "  2. Возврат на предыдущую станцию маршрута"
      puts "  3. Ускорение на 10 км/ч"
      puts "  4. Замедление на 10 км/ч"
      puts "  __________________"
      puts "  ПАССАЖИРСКИЙ ПОЕЗД:"
      puts "  5. Посадка в пассажирские вагононы"
      puts "  6. Высадка из пассажирских вагонов"
      puts "  7. Прицепить пассажирские вагоны"
      puts "  ______________"
      puts "  ТОВАРНЫЙ ПОЕЗД:"
      puts "  8.Загрузка товарных вагонов"
      puts "  9.Разгрузка товарных вагонов"
      puts "  10.Прицепить товарные вагоны"
      puts "                              "
      puts "  11.Расцепить вагоны "
      puts "  12.Показать состав "
      puts "  13.Информация о производителе"
      
    when 1
      
      begin
      train.forward_move
      puts "Следующая станция: #{train.show_next}"
      puts "Поезд на станции: #{train.current_stop}"
      puts "Предыдущая станция: #{train.show_previous}"
      raise NoMethodError
      rescue NoMethodError
      end

    when 2
      begin
      train.reverse_move
      puts "Следующая станция: #{train.show_next}"
      puts "Поезд на станции: #{train.current_stop}"
      puts "Предыдущая станция: #{train.show_previous}"
      raise TypeError
      raise NoMethodError
      rescue TypeError
      rescue NoMethodError
      end

    when 3
      train.speed_up
      puts "Текущая скорость #{train.speed} км/ч"
    when 4 
      train.speed_down
      puts "Текущая скорость #{train.speed} км/ч"

    when 5
      loop do
       begin
        puts "Выберите порядковый номер вагона для посадки пассажира"
        input = gets.chomp
        break if input == "next"
        index = input.to_i 
        puts "Выбран вагон: #{train.wagons[index]}"
        train.wagons[index].take_seat
        puts "Пассажир занял своё место"
        puts "Осталось #{train.wagons[index].free_seats} мест"
        puts "Занято #{train.wagons[index].occupied_seats} мест"
        puts "Для завершения посадки: 'next'"
        raise NoMethodError
        rescue NoMethodError
      end
    end

    when 6
      loop do
       begin
        puts "Выберите порядковый номер вагона для высадки пассажира"
        input = gets.chomp
        break if input == "next"
        index = input.to_i 
        puts "Выбран вагон: #{train.wagons[index]}"
        train.wagons[index].off_seat
        puts "Пассажир освободил место"
        puts "Осталось #{train.wagons[index].free_seats} мест"
        puts "Занято #{train.wagons[index].occupied_seats} мест"
        puts "Для завершения высадки: 'next'"
        raise NoMethodError
        rescue NoMethodError
      end    
    end

    when 7
      loop do
        puts "Нажимайте 'ENTER', чтобы начать прицеплять вагоны по одному"
        passengerwagon = gets.chomp
        break if passengerwagon == "next"
        passengerwagon = PassengerWagon.new
        train.hook_one(passengerwagon)
        puts "#{train.wagons}"
      end
        puts "Вагоны прицеплены"
       
                
    when 8
      loop do
        begin
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
        raise NoMethodError
        rescue NoMethodError
       end
      end
        puts "Загрузка завершена"
                    
    when 9
      loop do
       begin
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
        raise NoMethodError
        rescue NoMethodError
       end
      end
        puts "Разгрузка завершена"
             
    when 10
      loop do
        puts "Нажимайте 'ENTER', чтобы начать прицеплять вагоны по одному"
        cargowagon = gets.chomp
        break if cargowagon == "next"
        cargowagon = CargoWagon.new
        train.hook_one(cargowagon)
        puts "#{train.wagons}"
      end
        puts "Вагоны пирцеплены"
              
    when 11
      loop do
        puts "Нажимайте 'ENTER', чтобы отцеплять по одному вагону"
        unhook = gets.chomp
        break if unhook == "next"
        train.unhook_one
        puts "#{train.wagons}"
      end
        puts "Вагоны расцеплены"
      
    when 12
        puts "#{train} #{train.wagons}" 
    
    when 13
        puts "#{train.manufacturer}" 

    else puts "Неверный ввод"
  end
end

    




