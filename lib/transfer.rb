class Transfer

  attr_accessor :sender, :receiver, :amount, :status


  def initialize(sender, receiver, amount=50)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end


  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if @sender.balance < @amount || valid? == false
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif @sender.balance > @amount && status == "pending"
      @sender.deposit(@amount * -1)
      @receiver.deposit(@amount)
      @status = "complete"
    end
    #status = "pending" ? sender.balance > 50 ? sender.balance - @amount && receiver.deposit(amount) : "Transaction rejected. Please check your account balance." : false
  end

    def reverse_transfer
     if status != "complete"
    
      @receiver.balance
      @sender.balance

     else
     @receiver.deposit(@amount * -1)
      @sender.deposit(@amount)

      @status = "reversed"
     end
    end

end
