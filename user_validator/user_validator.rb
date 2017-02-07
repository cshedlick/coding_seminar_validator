## user validator

require 'csv'

class Validate
  def initialize(filename)
    @filename = filename
    @data = CSV.read(@filename)
  end

  # def get_names
  #   good_stuff = []
  #   @data.each do |subarray|
  #     subarray.each do |string|
  #       good_stuff << string.scan(regular_expression)
  #     end
  #   end
  #   good_stuff
  # end

  def get_phones
    good_phones = []
    good_phones_count = 0
    @data.each do |subarray|
      subarray.each do |string|
        good_phones += string.scan(/[^0]\d{2}(\S|\) )\d{3}\S\d{4}/) ##three digits, followed by either `-`  `.`  `)`  `) `, followed by three more digits, followed by either a - a . or nothing, then a non-zero value
        # good_phones_count += 1
      end
    end
    good_phones
    # puts good_phones_count
  end

  def get_emails
    good_emails = []
    good_emails_count = 0
    bad_emails_count = 0
    @data.each do |subarray|
      subarray.each do |string|
        good_emails += string.scan(/^\w{1,}[@]\w{1,}[.]\w{2,}$/) #at least one word character, @, at least one more word character, ., then at least two more word characters
        # good_emails_count += 1
      end
    end
    good_emails
    # puts good_emails_count
  end

  def validation
    @data.each do |validate|
      validate.each (included in) @data.get_emails && @data.get_emails && @data.get_joined #good_phones && good_emails && good_joined


end

homework = Validate.new('homework.csv')
puts homework.get_emails
puts homework.good_emails.length

# class InvalidJoined < StandardError
# end
#
# class InvalidEmail < StandardError
# end
#
# class InvalidPhone < StandardError
# end


# class UnknownCurrencyCodeError < StandardError
# end

# name:, joined:, age:, email:, phone:, password:


# def convert(obj, code)
#     raise CurrencyCodeError.new('That currency code is unknown') unless rates[obj.code] && rates[code]
#     if obj.code == code
#       Currency.new(amount: obj.amount, code: objcode)
#     else
#       Currency.new(amount: (obj.amount * rates[code]) / rates[obj.code], code: code)
#     end
#   end
