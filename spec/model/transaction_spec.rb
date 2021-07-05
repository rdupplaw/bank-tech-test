# frozen_string_literal: true

require 'transaction'

describe Transaction do
  context 'when given a credit' do
    subject(:credit_transaction) { described_class.new(date: '10-01-2012', credit: 1000) }

    it 'has a date' do
      expect(credit_transaction.date).to eq('10-01-2012')
    end

    it 'has a credit' do
      expect(credit_transaction.credit).to eq(1000)
    end
  end

  context 'when given a debit' do
    subject(:debit_transaction) { described_class.new(date: '03-11-2016', debit: 500) }

    it 'has a date' do
      expect(debit_transaction.date).to eq('03-11-2016')
    end

    it 'has a debit' do
      expect(debit_transaction.debit).to eq(500)
    end
  end

  it 'raises an error if given both credit and debit' do
    expect do
      described_class.new(date: '13-05-2022', credit: 2000, debit: 9000)
    end.to raise_error 'Transaction cannot have both credit and debit'
  end

  it 'raises an error if not given credit or debit' do
    expect { described_class.new(date: '27-03-1994') }.to raise_error 'Transaction must have credit or debit'
  end
end
