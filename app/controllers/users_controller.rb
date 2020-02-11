class UsersController < ApplicationController

    before_action :authenticate_user!
   
    def show
        @user = User.find(params[:id])
        #redirect_to login_url and return unless @user.activated?
        @listings = Listing.all
    end
    


    

end
