class PaymentSchedule

   def initialize
      @payments = Array.new
      @index = 0
   end

   def addPayment(payment)
      @payments[@index] = payment
      @index = @index + 1
   end
   
   def getPayments 
      @payments
   end
   
   def setTotalPrinciple(totalPrinciple)
      @totalPrinciple = totalPrinciple
   end
   
   def setTotalInterest(totalInterest)
      @totalInterest = totalInterest
   end
   
   def totalPrinciple
      @totalPrinciple
   end
   
   def totalInterest
      @totalInterest
   end
   
   def totalPayments
      @totalInterest + @totalPrinciple
   end

end