  p "Введите значение для числа A "
  a = gets.chomp.to_f
  b = a / 2

  r = (1..b.to_f)
  arr = r.to_a
  arr.map! { |i| i * 2}
  # преобразуем arr в массив из чётных чисел
  sum = 0 #присваеваем начальное значение для суммы, тип переменой числовое значение
  arr.each do | index | 
  sum = sum + index 
  end
  puts "В данном массиве #{arr}"
  puts "Сумма чётных чисел от 0 до #{a} = #{sum}"
  puts "Среднее арифметическое значение = #{sum / r.size}"








