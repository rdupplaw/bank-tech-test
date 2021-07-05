# frozen_string_literal: true

# Stores information about a single transaction
class Transaction
  attr_reader :date, :credit

  def initialize(date:, credit:)
    @date = date
    @credit = credit
  end
end
