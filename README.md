# Bank Tech Test

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```irb
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## Design

![Sequence diagram for Bank tech test](/sequence-diagram.png)

My design comprises a `BankAccount` class, a `BankTransaction` class and a `BankAccountStatementGenerator` class. The `BankAccount` class has `#deposit`, `#withdraw` and `#statement` public instance methods. These are the three methods required by the acceptance criteria and form the user interface for the program.

On deposits and withdrawals, the `BankAccount` instance will create a new `BankTransaction` instance which stores the date, credit, debit and balance information for one transaction.

I chose to have both the credit/debit value and date be given as arguments by the user, but I could have generated the date automatically within the Transaction class. Given that we're assuming the user to be trustworthy with regards to the credit or debit value, I thought it was safe to assume that the user was trustworthy with regards to the date.

When the user asks for a statement, a `BankAccountStatementGenerator` instance will generate the statement from the transactions it is given by the `BankAccount` instance. It will retrieve date, credit, debit and balance information from each transaction and format it as required.

### Built with

* Ruby
* RSpec

## Installation

```bash
git clone https://github.com/rdupplaw/bank-tech-test.git
cd bank-tech-test
bundle
```

## Usage

```Ruby
# In IRB
require './lib/bank_account'

bank_account = BankAccount.new

bank_account.deposit(2386, '13-07-2021')
bank_account.withdraw(347, '14-07-2021')
bank_account.withdraw(10000, '19-07-2021')

puts bank_account.statement
# output:
# date || credit || debit || balance
# 19/07/2021 || || 10000.00 || -2961.00
# 14/07/2021 || || 347.00 || 7039.00
# 13/07/2021 || 2386.00 || || 7386.00
# 10/07/2021 || 5000.00 || || 5000.00
```

## Testing

```bash
bundle exec rspec
```

This will also generate a coverage report (coverage/index.html)
