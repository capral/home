class CargoTrain < Train
  attr_reader :wagons

  def initialize (number, type)
    @number = number 
    @type = type 
    @wagons = [] 
    @speed = 0
    @train_route = nil
  end

  def hook_one(cargowagon)
    return nil if @speed > 0
    @wagons << cargowagon
  end
  
  def unhook_one(cargowagon) 
    return nil if @speed > 0
    @wagons.delete(cargowagon)
  end
end