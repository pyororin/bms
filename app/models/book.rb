class Book < ActiveRecord::Base
  attr_accessible :desc, :last, :name, :yomi
end
