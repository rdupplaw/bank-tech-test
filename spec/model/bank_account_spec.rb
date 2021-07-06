# frozen_string_literal: true

require 'bank_account'
require 'bank_transaction' # Required for verifying class double

describe BankAccount do
  let(:transaction_class_double) { class_double('BankTransaction') }

  describe '#deposit' do
    it 'creates a new Transaction' do
      bank_account = described_class.new(transaction_class: transaction_class_double)
      allow(transaction_class_double).to receive(:new)
      bank_account.deposit(1700, '27-04-2019')

      expect(transaction_class_double).to have_received(:new)
        .with(date: '27-04-2019', credit: 1700, previous_balance: 0)
    end
  end
end
