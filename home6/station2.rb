class Station
  attr_reader :name, :list
    @@all_stations = []

  def self.all_stations
    @@all_stations
  end

  def initialize (name)
    @name = name 
    @list = [] 
    validate!
    @@all_stations << self
  end

  def add_list (train) 
    @list << train
  end

  def delete_list (train)
    @list.delete
  end

  def type_list 
     type_list = Hash.new(0)
    @list.map { |train| type_list[train.type] += 1 }
     type_list
  end

  def valid?
    validate!
    true
  rescue 
    false
    
  end

  protected

  def validate!
    raise ArgumentError, "!!! Вы не ввели название станции !!!" if name.empty?
    raise ArgumentError, "!!! Название станции не может состоять из одной буквы !!!" if name.size < 2
    # raise ArgumentError, "!!! Думай что пишешь !!!" 
    # raise ArgumentError, "Неверный ввод!" if name !~ \A\W*\z
  end
end
