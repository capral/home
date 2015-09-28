p "Введите значение для числа A "
  a = gets.chomp.to_i

  r = (1..a.to_f)
  arr = r.to_a
 
  factorial = arr.inject(1){ |result, elem| result * elem }

  puts "В данном массиве #{arr}"
  puts "Произведение всех чисел до числа #{a} = #{factorial}"