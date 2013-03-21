module Bms
  module Version
    MAJOR  = 0
    MINOR  = 0
    TINY   = 1
    STRING = 'ver' + [MAJOR, MINOR, TINY].join('.').freeze
  end
end

module Constants
  HOGE = 1
  FOO  = 2
end