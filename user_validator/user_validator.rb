## user validator

require 'csv'

class Validate
  def initialize(filename)
    @filename = filename
    @data = CSV.read(@filename, :headers=>true)
    @emails = @data['email']
    @phones = @data['phone']
    @joineds = @data['joined']
  end

  def get_phones
    good_phones = []
    good_phones_count = 0
    @phones.each do |string|
      # subarray.each do |string|
        good_phones += string.scan(/[^0]\S\d{4}/) ##three digits, followed by either `-`  `.`  `)`  `) `, followed by three more digits, followed by either a - a . or nothing, then a non-zero value
        # good_phones_count += 1
      # end
    end
    good_phones
    # puts good_phones_count
  end

  def get_emails
    good_emails = []
    good_emails_count = 0
    bad_emails_count = 0
    @emails.each do |string|
      # subarray.each do |string|
        good_emails += string (/^\w{1,}[@]\w{1,}[.]\w{2,}$/) #at least one word character, @, at least one more word character, ., then at least two more word characters
      # end
    end
    good_emails
  end

  def valid_email?(input)
    !!input['email'].scan(/^\w{1,}[@]\w{1,}[.]\w{2,}$/) #.scan or .match
  end

  def get_joined
    good_joined = []
    good_joined_count = 0
    bad_joined_count = 0
    @joineds.each do |string|
      # subarray.each do |string|
        good_joined += string.scan(/^\d{1,2}\S\d{1,2}\S\d{2,4}$/) # not the final regular expression for this
      # end
    end
    good_joined
  end

  def valid_joined?(input)
    !!input['joined'].scan(/^\d{1,2}\S\d{1,2}\S\d{2,4}$/)
  end

  # def all_valid?
  #   valid_rows = []
  #   valid_count = 0
  #   invalid_count = 0
  #   @data.each do |validate|
  #     # subarray.each do |validate|
  #       # @data.get_emails.include? validate['email']
  #     valid_rows << valid_email?(validate) && valid_joined?(validate)
  #     valid_count += 1
  #   # end
  #   end
  #   @data.select{valid_rows}
  # end




end

homework = Validate.new('homework.csv')
# puts homework.get_emails
# puts homework.get_joined
# puts homework.get_phones
puts homework.get_emails
# puts homework.all_valid?
