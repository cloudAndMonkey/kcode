require 'Payment.rb'
require 'PaymentSchedule.rb'

class Loan
   def initialize(rate, months, presentValue)
      @rate = rate.to_f
      @months = months.to_i
      @presentValue = presentValue.to_f
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
      balance = presentValue
      totalPrinciple = 0
      totalInterest = 0
      
      fRate = rate.to_f / 1200
      
      i = 0
      schedule = PaymentSchedule.new
      months.times do
         i = i + 1
         interest = ((balance * fRate) * 100).round.to_f / 100
         principle = ((payment - interest) * 100).round.to_f / 100
         if (balance < payment) 
	    principle = (balance * 100).round.to_f / 100
         end
         totalPrinciple += principle
         totalInterest += interest
         balance = ((balance - principle) * 100).round.to_f / 100
         
         pmt = Payment.new(i, principle, interest, balance)
         schedule.addPayment(pmt)
         
         # puts "INTEREST: #{pmt.interest} PRINCIPLE: #{pmt.principle} BALANCE: #{pmt.balance}"
      end
      schedule.setTotalPrinciple(totalPrinciple)
      schedule.setTotalInterest(totalInterest)
      schedule
   end

end