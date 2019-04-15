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
      transaction = sender.balance - @amount
      deposit = receiver.balance + @amount 
      deposit
      transaction
    else
      "Transaction rejected. Please check your account balance."
    end 
  end 
   
end
