# frozen_string_literal: true

# Stores information about a single transaction
class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(date:, previous_balance:, credit: nil, debit: nil)
    validate_params(credit, debit)

    @date = date
    @credit = credit
    @debit = debit
    @balance = calculate_new_balance(previous_balance, credit, debit)
  end

  private

  def validate_params(credit, debit)
    raise 'Transaction cannot have both credit and debit' if credit && debit
    raise 'Transaction must have credit or debit' unless credit || debit
  end

  def calculate_new_balance(previous_balance, credit, debit)
    return previous_balance + credit if credit

    previous_balance - debit
  end
end
