# encoding utf-8

puts "Вычислим площадь треугольника(S)"

puts "введите значение основания(a):"

a = gets.chomp.to_f

puts "Введите значение высоты(h):"

h = gets.chomp.to_f

puts "Площадь треугольника(S) = 1/2 * #{a} * #{h} = #{ 0.5 * a * h }"