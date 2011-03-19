require 'Buildings/enterable'
require 'Buildings/burnable'

module Building
  class Building
    include Enterable
    include Burnable
  end
end
