require 'test/unit'
require 'Loan.rb'

class LoanTest < Test::Unit::TestCase
   def test_init
      loan = Loan.new(10.0, 12, 5000)
      assert_equal(loan.rate, 10.0, "Rate should be 0.1")
      assert_equal(loan.months, 12, "Months should be 12")
      assert_equal(loan.presentValue, 5000, "Present Value should be 5000")
   end
   
   def test_calc
      loan = Loan.new(12, 12, 1200)
      amount = loan.calculateMonthlyPayment()
      assert_equal(amount, 106.62, "Monthly payment should be 106.62")
   end
   
   def test_schedule
      loan = Loan.new(12, 12, 1200)
      amount = loan.calculatePaymentSchedule()
      assert_equal(amount, 106.62, "Monthly payment should be 106.62")
      
   end
end