class Record

  attr_accessor :to, :from
  attr_reader :amount, :type

  @to = ""
  @from = "world"
  @amount
  @type

  def initialize amount, type
    @amount = amount
    @type = type
  end
  
end
