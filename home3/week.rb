# encoding utf-8
puts "Введите номер дня недели от 1 до 7, чтобы узнать какое название ему соответствует:"

num = gets.chomp.to_i

case num
  when 1
    result = "Понедельник"
  when 2
    result = "Вторник"
  when 3
    result = "Среда"
  when 4
    result = "Четверг"
  when 5
    result = "Пятница"
  when 6
    result = "Суббота"
  when 7
    result = "Воскресенье"
  else
    puts "Неверный ввод"
end

puts "#{result}"
