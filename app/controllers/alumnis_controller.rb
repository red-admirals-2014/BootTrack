class AlumnisController < ApplicationController
  def index
    users = DBC::User.all
    p users
  end
end
