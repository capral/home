# encoding utf-8
puts "Введите номер дня недели от 1 до 7, чтобы узнать какое название ему соответствует:"

num = gets.chomp.to_i
week = gets.chomp.to_i

week = 
{ 
	1 => "Понедельник", 2 => "Вторник", 3 => "Среда", 
	4 => "Четверг", 5 => "Пятница",
 	6 => "Суббота", 7 => "Воскресенье" 
 } 

dey = week[day]

if day
	puts "Сегодня" - #{day}."
else
	puts "Неверный день"
end

#day ? puts "Сегодня" - #{day}." : puts "Неверный день"
day = week[day]
message = day ? puts "Сегодня" - #{day}." : "Неверный день"
puts message

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
