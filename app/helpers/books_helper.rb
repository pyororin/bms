# -*- encoding: utf-8 -*-
module BooksHelper
  def complete_flg book
    '☆ ' if book.complete
  end
  
  def disp_number book
    ret = '1'
    return ret if book.last == 1
    ret << '～'
    ret << book.last.to_s
  end
end
