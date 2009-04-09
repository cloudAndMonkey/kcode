class Loan
   def initialize(rate, months, presentValue)
      @rate = rate;
      @months = months
      @presentValue = presentValue
   end
   
   def rate
      @rate
   end
      
   def months
      @months
   end
      
   def presentValue
      @presentValue
   end
   
   def to_s
      "-- Rate #{@rate}-- Months #{@months}-- PresentValue #{@presentValue}"
   end
   
   def calculateMonthlyPayment
      fPresentValue = presentValue.to_f
      fRate = rate.to_f / 1200
      fMonths = months.to_f
      
      
      revisedRate = fRate + 1;
      powRate = revisedRate**fMonths

      left = powRate * fPresentValue
      middle = fRate / (powRate - 1)

      right = 1
      
      payment = left * middle * right
      
      (payment * 100).round.to_f / 100     
   end
   
   def calculatePaymentSchedule
      payment = self.calculateMonthlyPayment
      balance = (presentValue * 100).to_f / 100
      totalPrinciple = 0
      totalInterest = 0
      
      fRate = rate.to_f / 1200
      
      i = 0
      months.times do
         i = i + 1
         puts i.to_s
         interest = ((balance * fRate) * 100).round.to_f / 100
         principle = ((payment - interest) * 100).round.to_f / 100
         if (balance < payment) 
	    principle = balance
         end
         totalPrinciple += principle
         totalInterest += interest
         
         balance = balance - principle
         
         puts "INTEREST: #{interest} PRINCIPLE: #{principle} BALANCE: #{balance}"
      end
      puts "TOTAL PRINCIPLE: #{totalPrinciple}"
      puts "TOTAL INTEREST: #{totalInterest}"
      payment
   end

end