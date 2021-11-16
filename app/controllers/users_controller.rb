class UsersController < ApplicationController

def f_name
@user = User.find_by(params[:id])
end
end