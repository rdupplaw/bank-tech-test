require 'bank_account'
require 'bank_transaction'
require 'bank_account_statement_generator'

describe 'Acceptance test' do
  subject(:bank_account) { BankAccount.new }
  it 'returns a correct bank statement' do
    bank_account.deposit(1000, '10-01-2012')
    bank_account.deposit(2000, '13-01-2012')
    bank_account.withdraw(500, '14-01-2012')

    expect(bank_account.statement).to eq("date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00")
  end
end
