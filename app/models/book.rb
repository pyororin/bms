# -*- encoding: utf-8 -*-
class Book < ActiveRecord::Base
  attr_accessible :desc, :last, :name, :yomi, :complete
  validates :name, :presence => {:message => 'は必須です。'}, :uniqueness => {:message => 'は既に登録されています。'}
  validates :yomi, :presence => {:message => 'は必須です。'}, :uniqueness => {:message => 'は既に登録されています。'},
    :format => {:with => /^[ァ-ヶ|ー]+$/}
  validates :last, :presence => {:message => 'は必須です。'}, :numericality => {:only_integer => true}
end
