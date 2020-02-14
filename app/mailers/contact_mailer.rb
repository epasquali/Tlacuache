class ContactMailer < ApplicationMailer
  default from: "webmaster@tlacuache.org"

    def contact_listing_owner(listing, contactmsg)
      @user = listing.user
      @contactmsg = contactmsg
      @listing = listing
      mail to: listing.user.email, reply_to: contactmsg.email, subject: "El Tlacuache -- tu anuncio "
    end
end