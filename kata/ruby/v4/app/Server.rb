require 'webrick'
require 'LoanEntry'
require 'Loan'
require 'Payment'
require 'LoanEntry'
require 'PaymentSchedule'

include WEBrick

def start_WEBrick(config = {})
   config.update(:Port => 8181)
   server = HTTPServer.new(config)
   server.mount("/loan", LoanEntry)
   yield server if block_given?
      ['INT', 'TERM'].each {|signal|
      trap(signal) {server.shutdown}
      }
   server.start
end

start_WEBrick(:DocumentRoot => "./var/www")
