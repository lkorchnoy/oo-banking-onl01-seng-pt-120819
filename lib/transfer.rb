class Transfer 
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver 
    @status = "pending"
    @amount = 50
  end 
  def valid? 
    sender.valid? && receiver.valid?
  end 
  def execute_transaction
    if !self.valid? || self.status == "complete"
      self.status = "rejected"
      sender.close_account
      "Transaction rejected. Please check your account balance."
    else 
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
    end 
  end 
  def reverse_transfer
    if self.status == "complete"
      sender.balance += self.amount 
      receiver.balance -= self.amount 
      self.status = "reversed"
    end
  end 
end 