class UsersController < ApplicationController

    before_action :authenticate_user!
    before_action :correct_user
   
    def show
        @user = User.find(params[:id])
        #redirect_to login_url and return unless @user.activated?
        @listings = @user.listings
    end
    

    private

      def correct_user
        @user = User.find(params[:id])
        #redirect_to(user_path(current_user)) unless ( (current_user == @user) || current_user.admin)
        redirect_to(user_path(current_user)) unless (current_user == @user)
      end
    

end
