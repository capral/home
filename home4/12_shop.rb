=begin Сумма покупок. Пользователь вводит поочередно название товара,
цену за единицу и кол-во купленного товара (может быть нецелым числом).
Пользователь может ввести произвольное кол-во товаров до тех пор, пока не введет "стоп"
в качестве названия товара. На основе введенных данных требуетеся:
Заполнить и вывести на экран хеш, ключами которого являются названия товаров, 
а значением - вложенный хеш, содержащий цену за единицу товара и кол-во купленного товара. 
Также вывести итоговую сумму за каждый товар.
Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".
=end


cart={}
loop do
	print "Введите название товара или \"стоп\" для расчёта: "
	name=gets.strip
	break if name.downcase=="стоп"
	print "Введите цену за единицу товара: "
	price=gets.chomp.to_f
	print "Введите кол-во товара: "
	amount=gets.chomp.to_f
	cart[name]={price:price, amount:amount}
end

total=0
puts "CОДЕРЖИМОЕ КОРЗИНЫ:"
cart.each do |k,v|
	item_total=v[:price]*v[:amount]
	puts "#{k}. Цена: #{v[:price]}, кол-во: #{v[:amount]}, стоимость: #{item_total}"
	total+=item_total
end

puts "ИТОГО: #{total}"