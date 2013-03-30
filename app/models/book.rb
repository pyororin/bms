# -*- encoding: utf-8 -*-
class Book < ActiveRecord::Base
  attr_accessible :desc, :last, :name, :yomi, :complete
  validates :name, :presence => {:message => 'は必須です。'}, :uniqueness => {:message => 'は既に登録されています。'}
  validates :yomi, :presence => {:message => 'は必須です。'}, :uniqueness => {:message => 'は既に登録されています。'},
    :format => {:with => /^[ァ-ヶ|ー]+$/}
  validates :last, :presence => {:message => 'は必須です。'}, :numericality => {:only_integer => true}
    
  def self.export(book)
    require 'csv'
    CSV.generate(:row_sep => "\r\n") do |csv|
      book.each do |col|
        csv << [col.id, col.name, col.yomi, col.last, col.desc,
          col.created_at, col.updated_at, col.complete, col.user_id]
      end
    end.encode(Encoding::SJIS)
  end
end
