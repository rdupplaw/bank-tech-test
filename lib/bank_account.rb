# frozen_string_literal: true

require_relative 'bank_transaction'
require_relative 'bank_account_statement_generator'

# Controls bank transactions
class BankAccount
  def initialize(transaction_class: BankTransaction, statement_generator: BankAccountStatementGenerator.new)
    @transaction_class = transaction_class
    @statement_generator = statement_generator
    @transactions = []
  end

  def deposit(credit, date)
    @transactions << @transaction_class.new(date: date, credit: credit, previous_balance: previous_balance)
  end

  def withdraw(debit, date)
    @transactions << @transaction_class.new(date: date, debit: debit, previous_balance: previous_balance)
  end

  def statement
    @statement_generator.generate_statement(@transactions)
  end

  private

  def previous_balance
    @transactions.last&.balance || 0
  end
end
