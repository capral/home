class Train
  attr_reader :number, :type, :vagons, :speed, :train_route 

  def initialize (number, type, vagons)
    @number = number 
    @type = type 
    @vagons = vagons 
    @speed = 0
    @train_route = nil
  end

  def hook_one 
    @vagons += 1 if vagons < 101 && speed == 0
  end
  
  def unhook_one 
    @vagons -= 1 if vagons > 1 && speed == 0
  end

  def speed_up
    @speed += 10 if speed < 110 
  end

  def speed_down
    @speed -= 10 if @speed >= 10
  end

  def add_route(route) 
    @train_route = route 
    @index = 0
    @current_stop = @train_route.route_list[0].name
  end

  def current_stop
    @current_stop 
  end

  def increment_index 
    @index += 1 
  end

  def forward_move 
    @current_stop = @train_route.route_list[increment_index].name if @index <= (@train_route.route_list.size - 1)  
  end

  def decrement_index
    @index -= 1 if @index > 0
  end

  def reverse_move 
    @current_stop = @train_route.route_list[decrement_index].name if @index >= 0
  end

  def show_next
    @train_route.route_list[@index + 1].name  
  end

  def show_previous
    @train_route.route_list[@index - 1].name  
  end
end