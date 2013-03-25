# -*- encoding: utf-8 -*-
class SessionsController < Devise::SessionsController
  def new
    @page_title = 'ログイン'
    super
  end
end
