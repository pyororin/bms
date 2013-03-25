# -*- encoding: utf-8 -*-
module BooksHelper
  def complete_flg book
    '☆ ' if book.complete
  end
end
