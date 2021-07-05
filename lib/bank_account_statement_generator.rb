# frozen_string_literal: true

require 'date'

# Generates formatted bank statement
class BankAccountStatementGenerator
  def generate_statement(transactions)
    header + format_table_rows(transactions)
  end

  private

  def header
    "date || credit || debit || balance\n"
  end

  def format_table_rows(transactions)
    transactions.sort_by(&:date).reverse.map do |transaction|
      format_table_row(transaction)
    end.join("\n")
  end

  def format_table_row(transaction)
    "#{format_date(transaction.date)} || #{format_credit_or_debit(transaction.credit)}|| #{format_credit_or_debit(transaction.debit)}|| #{format_balance(transaction.balance)}"
  end

  def format_date(date)
    Date.parse(date).strftime('%d/%m/%Y')
  end

  def format_credit_or_debit(value)
    "#{'%.2f' % value} " if value
  end

  def format_balance(balance)
    '%.2f' % balance
  end
end
