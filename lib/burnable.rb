require 'money_storage'

module Burnable

  def burn
    @money = MoneyStorage.new @owner, 0
  end

end
