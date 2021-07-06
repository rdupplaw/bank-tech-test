# frozen_string_literal: true

require 'bank_transaction'

# Controls bank transactions
class BankAccount
  def initialize(transaction_class: BankTransaction)
    @transaction_class = transaction_class
    @transactions = []
  end

  def deposit(credit, date)
    @transactions << @transaction_class.new(date: date, credit: credit, previous_balance: previous_balance)
  end

  private

  def previous_balance
    @transactions.last&.balance || 0
  end
end
