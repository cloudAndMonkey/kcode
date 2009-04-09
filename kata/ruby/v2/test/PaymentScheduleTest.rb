require 'test/unit'
require 'PaymentSchedule.rb'

class PaymentScheduleTest < Test::Unit::TestCase
   
   def test_singlepayment
      schedule = PaymentSchedule.new
      schedule.addPayment("payment1")
      payments = schedule.getPayments
      payments.each {|p| assert_equal(p, "payment1", "Payment should be string literal payment1")}
   end
   
   def test_totals
      schedule = PaymentSchedule.new
      schedule.setTotalInterest(100.00)
      schedule.setTotalPrinciple(1000.00)
      assert_equal(schedule.totalPayments, 1100.00, "Total payments should be 1100.00")
   end
end