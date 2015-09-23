#Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя).
#Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным. 
#Не использовать встроенные методы класса Date для этого.

puts "Определим порядковый номер даты с начала года"

puts "Введите число"
d = gets.chomp.to_i

puts "Введите месяц"
m = gets.chomp.to_i

puts "Введите год"
y = gets.chomp.to_i

v = y % 4

feb = 0

if v > 0
	elsif feb == 0
	else feb == 1
end

case m
  when 1
    result = 0
  when 2
    result = 31
  when 3
    result = 31 + 28 + feb
  when 4
    result = 31 + 28 + 31 + feb
  when 5
    result = 31 + 28 + 31 + 30 + feb
  when 6
    result = 31 + 28 + 31 + 30 + 31 + feb
  when 7
    result = 31 + 28 + 31 + 30 + 31 + 30 + feb
  when 8
    result = 31 + 28 + 31 + 30 + 31 + 30 + 31 + feb
  when 9
    result = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + feb
  when 10
    result = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 31 + feb
  when 11
    result = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 31 + 31 + feb
  when 12
    result = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 31 + 31 + 30 + feb

  else
    puts "Неверный ввод"
end

puts "Вы ввели дату #{d + result} дня года"

