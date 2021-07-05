# frozen_string_literal: true

require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new(date: '10-01-2012', credit: 1000, debit: 500) }

  it 'has a date' do
    expect(transaction.date).to eq('10-01-2012')
  end

  it 'has a credit' do
    expect(transaction.credit).to eq(1000)
  end

  it 'has a debit' do
    expect(transaction.debit).to eq(500)
  end
end
