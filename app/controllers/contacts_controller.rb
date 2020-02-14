class ContactsController < ApplicationController

    def listing_contact
      #Sends email to listing owner
      @contactmsg = Contactmsg.new(contactmsg_params)
      @listing = Listing.find(params[:listing_id])

      if @contactmsg.valid?
        ContactMailer.contact_listing_owner(@listing, @contactmsg).deliver_now
        flash[:success] = t 'contactmsgsent'
        redirect_to @listing 
      else
        flash.now[:error] = t 'contactmsgnotsent'
        render 'listings/show'
      end
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    private
      def contactmsg_params
        params.require(:contactmsg).permit(:name, :email, :message)
      end

end
