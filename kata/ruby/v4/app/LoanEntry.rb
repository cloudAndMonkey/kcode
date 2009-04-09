require 'webrick'
#require 'Loan'
#require 'PaymentSchedule'
#require 'Payment'

include WEBrick

class LoanEntry < HTTPServlet::AbstractServlet
   def do_GET(req, resp)
      rate = req.query['rate']
      term = req.query['term']
      principle = req.query['principle']
      
      if (rate == nil or term == nil or principle == nil) 
         resp.body = "Enter correct parameters. The URL query string should resemble <b>\"?rate=<i>interest</i>&term=<i>months</i>&principle=<i>amount</i>\"</b>"
         resp['content-type'] = 'text/html'
         raise HTTPStatus::OK
      end
      
      loan = Loan.new(rate, term, principle)
      #payment = loan.calculateMonthlyPayment
      #resp.body = "The monthly payment is: #{payment}"
      schedule = loan.calculatePaymentSchedule
      xml = generateXML(schedule)
      resp.body = xml
      resp['content-type'] = 'text/xml'
      raise HTTPStatus::OK
   end
   
   def generateXML(schedule)
      payments = schedule.getPayments
      xml = "<PaymentSchedule totalprinciple=\"#{schedule.totalPrinciple}\" totalinterest=\"#{schedule.totalInterest}\" totalpayments=\"#{schedule.totalPayments}\">\n"
      payments.each { |p|
         xml = xml + "   <payment number = \"#{p.number}\">\n      <principle>#{p.principle}</principle>\n      <interest>#{p.interest}</interest>\n      <balance>#{p.balance}</balance>\n   </payment>\n"
      }
      xml = xml + "</PaymentSchedule>"
   end
end