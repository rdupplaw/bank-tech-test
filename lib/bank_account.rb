# frozen_string_literal: true

require 'bank_transaction'

# Controls bank transactions
class BankAccount
  def initialize(transaction_class: BankTransaction)
    @transaction_class = transaction_class
  end

  def deposit(credit, date)
    @transaction_class.new(date: date, credit: credit, previous_balance: 0)
  end
end
