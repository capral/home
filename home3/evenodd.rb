# encoding utf-8
puts "Определитель чётных/нечётных чисел"
puts "Введите число:"

a = gets.chomp.to_i
b = a % 2

	if b == 0 
		
		puts "Вы ввели чётное число"

	elsif b >= 1
		
		puts "Вы ввели нечётное число"

	else
		puts "Неправильный ввод"	
	
	end 
