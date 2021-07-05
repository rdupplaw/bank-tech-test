# frozen_string_literal: true

require 'bank_account_statement_generator'
require 'bank_transaction' # Required for verifying instance doubles

describe BankAccountStatementGenerator do
  describe '#generate_statement' do
    it 'returns a table showing each transaction in reverse chronological order' do
      allow(transaction_double_1 = instance_double('BankTransaction')).to receive_messages(date: '10-01-2012',
                                                                                           credit: 1000, debit: nil, balance: 1000)
      allow(transaction_double_2 = instance_double('BankTransaction')).to receive_messages(date: '13-01-2012',
                                                                                           credit: 2000, debit: nil, balance: 3000)
      allow(transaction_double_3 = instance_double('BankTransaction')).to receive_messages(date: '14-01-2012',
                                                                                           credit: nil, debit: 500, balance: 2500)

      expected_output = "date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00"
      actual_output = subject.generate_statement([transaction_double_1, transaction_double_3, transaction_double_2])

      expect(actual_output).to eq(expected_output)
    end
  end
end
