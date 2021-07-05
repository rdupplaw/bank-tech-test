# frozen_string_literal: true

require 'transaction'

describe Transaction do
  it 'has a date' do
    transaction = described_class.new(date: '10-01-2012')

    expect(transaction.date).to eq('10-01-2012')
  end
end
