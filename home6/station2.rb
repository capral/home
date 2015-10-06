class Station
attr_reader :name, :list

  def initialize (name)
    @name = name 
    @list = [] 
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
end