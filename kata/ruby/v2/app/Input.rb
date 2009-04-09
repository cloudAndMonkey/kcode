require 'Loan.rb'

class Input 

   def gather
      print "Enter rate: "
      rate = gets
      
      print "Enter months: "
      months = gets
      
      print "Enter present value: "
      presentValue = gets
      
      print "Payment Schedule (1) or Monthly Payment (2): "
      outputFormat = gets

      loan = Loan.new(rate.chomp, months.chomp, presentValue.chomp)      
      if outputFormat.chomp == "1"
         schedule = loan.calculatePaymentSchedule
         schedule.getPayments.each {|s| puts "#{s.number} --> INTEREST: #{s.interest} PRINCIPLE: #{s.principle} BALANCE: #{s.balance}"}
      elsif outputFormat.chomp == "2"
         amt = loan.calculateMonthlyPayment
         puts amt.to_s
      end
      
   end
end

input = Input.new
input.gather
