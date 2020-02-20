# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class ContactMailerPreview < ActionMailer::Preview

    # Preview this email at
    # http://localhost:3000/rails/mailers/

    def contact_listing_owner
        listing = Listing.first
        contactmsg = Contactmsg.new({name: "Ben Bitdiddle", email: "ben@example.com", message: "I'm interested in your ad. Thank you."})
        ContactMailer.contact_listing_owner(listing, contactmsg)
    end

  end