require 'Loan.rb'

class Input 

   def gather
      print "Enter rate: "
      rate = gets
      
      print "Enter months: "
      months = gets
      
      print "Enter present value: "
      presentValue = gets
      
      loan = Loan.new(rate, months, presentValue)
      loan.calculateMonthlyPayment
   end
end

input = Input.new
amt = input.gather
puts amt.to_s
