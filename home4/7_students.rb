=begin 
       Запросить у пользователя кол-во студентов в группе.
	   Для каждого студента запросить оценку по 100-бальной шакле,
	   вывести среднюю оценку группы. Для решения использовать массивы
=end

puts "Количество студентов в группе:"
a = gets.chomp.to_i 
index = 0
sum = 0
puts "Вводите оценки студентов по 100-бальной шкале: "
arr = [] 
while index < a do 
	
	puts "Оценка студента №#{index + 1}"
	arr << gets.chomp.to_i
	sum = sum + arr[index]
	index = index + 1
end
puts "Средняя оценка = #{sum.to_f / a} баллов"