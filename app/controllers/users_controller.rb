# -*- encoding: utf-8 -*-
require 'devise'
class UsersController < Devise::UsersController
  def index
    @title = 'ユーザ管理'
  end
end
