class BankAccount
   @@balance = 1000
  attr_reader :name
  
  def initialize(name)
    @name = name
    @@balance = 1000
    @status = open
  end
  
  def deposit(n)
    @@balance << deposit(n)
end

def display_balance
  @@balance
end

def valid(balance)
  balance.each {|b| b > 0, @status = open}
end

def close_account(balance)
  balance.each {|b| if b < 0, @status != open}
end

end
