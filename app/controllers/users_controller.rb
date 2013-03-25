# -*- encoding: utf-8 -*-
class UsersController < Devise::UsersController
  def index
    @title = 'ユーザ管理'
  end
end
