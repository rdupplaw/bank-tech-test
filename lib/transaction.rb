# frozen_string_literal: true

# Stores information about a single transaction
class Transaction
  attr_reader :date, :credit, :debit

  def initialize(date:, credit:, debit:)
    @date = date
    @credit = credit
    @debit = debit
  end
end
