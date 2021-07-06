# frozen_string_literal: true

require 'bank_account'
require 'bank_transaction' # Required for verifying class double

describe BankAccount do
  let(:transaction_class_double) { class_double('BankTransaction') }
  let(:transaction_double) { instance_double('BankTransaction') }

  describe '#deposit' do
    it 'creates a new Transaction with a credit' do
      bank_account = described_class.new(transaction_class: transaction_class_double)
      allow(transaction_class_double).to receive(:new)

      bank_account.deposit(1700, '27-04-2019')

      expect(transaction_class_double).to have_received(:new)
        .with(date: '27-04-2019', credit: 1700, previous_balance: 0)
    end

    it 'previous balance is based on last transaction' do
      bank_account = described_class.new(transaction_class: transaction_class_double)
      allow(transaction_class_double).to receive(:new).and_return(transaction_double)
      allow(transaction_double).to receive(:balance).and_return(2585)

      bank_account.deposit(100, '12-08-2011')
      bank_account.deposit(204, '13-08-2011')

      expect(transaction_class_double).to have_received(:new)
        .with(date: '13-08-2011', credit: 204, previous_balance: 2585)
    end
  end

  describe '#withdraw' do
    it 'creates a new Transaction with a debit' do
      bank_account = described_class.new(transaction_class: transaction_class_double)
      allow(transaction_class_double).to receive(:new)

      bank_account.withdraw(400, '20-01-1999')

      expect(transaction_class_double).to have_received(:new)
        .with(date: '20-01-1999', debit: 400, previous_balance: 0)
    end

    it 'previous balance is based on last transaction' do
      bank_account = described_class.new(transaction_class: transaction_class_double)
      allow(transaction_class_double).to receive(:new).and_return(transaction_double)
      allow(transaction_double).to receive(:balance).and_return(1273)

      bank_account.withdraw(220, '06-09-2017')
      bank_account.withdraw(307, '07-08-2017')

      expect(transaction_class_double).to have_received(:new)
        .with(date: '07-08-2017', debit: 307, previous_balance: 1273)
    end
  end
end
