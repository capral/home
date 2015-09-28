loop do
  p "Введите значение для числа A или 'q' для выхода: "
  a = gets.chomp
  break if a == "q"

  result = 0
  sum = 0
  (1..a.to_i).each do | index | if index % 2 == 0
      result = result + index
      sum = sum + 1
    end
  end
  puts "Сумма чётных чисел от 1 до #{a} = #{result}"
  puts "Среднее арифметическое значение чётных чисел от 1 до #{a} = #{result / sum.to_f}"
end
