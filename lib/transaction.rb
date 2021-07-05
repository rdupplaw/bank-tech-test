# frozen_string_literal: true

# Stores information about a single transaction
class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(date:, credit: nil, debit: nil, previous_balance:)
    raise 'Transaction cannot have both credit and debit' if credit && debit

    raise 'Transaction must have credit or debit' unless credit || debit

    @date = date
    @credit = credit
    @debit = debit
    @balance = calculate_new_balance(previous_balance, credit, debit)
  end

  private

  def calculate_new_balance(previous_balance, credit, debit)
    previous_balance + credit if credit
  end
end
