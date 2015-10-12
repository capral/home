class PassengerTrain < Train
  attr_reader :wagons

  def initialize (number)
    @number = number  
    @wagons = [] 
    # @wagon = wagon = nil
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

 #Метод который добавляет пассажиров в поезд

# def take_a_train
    
# end
end