class PassengerTrain < Train
  attr_reader :wagons

  def initialize (number, type)
    @number = number 
    @type = type 
    @wagons = [] 
    @speed = 0
    @train_route = nil
 end

  def hook_one(passengerwagon) 
    return nil if @speed > 0
    @wagons << passengerwagon
  end
  
  def unhook_one(passengerwagon) 
    return nil if @speed > 0
    @wagons.delete(passengerwagon)
  end
end