require 'pry'
class Transfer
  attr_reader :sender, :receiver, :status, :amount
  
  def initialize(sender,receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount  
    #binding.pry 
  end 

  def valid?
    sender.valid? && receiver.valid?
  end 
  
  def execute_transaction
    if self.valid? && sender.balance > @amount && @status == "pending"
      sender.balance -= @amount
      receiver.balance += @amount 
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end 
  
  def reverse_transfer
    if @status == "complete" && @status != "pending" || @status != "rejected"
      sender.balance += @amount
      receiver.balance -= @amount 
    end 
    
  end 
   
end
