# encoding utf-8

puts "Привет, как тебя зовут?"

name = gets.chomp

puts "Привет, #{name}, укажи свой рост в сантиметрах"

weight = gets.chomp.to_i 

puts "#{name}, поздравляем, твой идеальный вес составляет #{weight - 110} кг"



