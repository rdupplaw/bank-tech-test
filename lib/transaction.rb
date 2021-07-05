# frozen_string_literal: true

# Stores information about a single transaction
class Transaction
  attr_reader :date, :credit, :debit

  def initialize(date:, credit: nil, debit: nil)
    raise 'Transaction cannot have both credit and debit' if credit && debit

    raise 'Transaction must have credit or debit' unless credit || debit

    @date = date
    @credit = credit
    @debit = debit
  end
end
