require 'pry'
class Transfer
  attr_reader :sender, :receiver, :status, :amount
  
  def initialize(sender,receiver, status)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50 
    #binding.pry 
  end 

  def valid?
    sender.valid? && receiver.valid?
  end 
  
  def execute_transaction
    if sender.valid? 
      sender.balance -= @amount
      receiver.balance += @amount 
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end 
   
end
