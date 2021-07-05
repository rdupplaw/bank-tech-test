# frozen_string_literal: true

# Stores information about a single transaction
class Transaction
  attr_reader :date

  def initialize(date:)
    @date = date
  end
end
