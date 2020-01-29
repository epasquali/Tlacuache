class PagesController < ApplicationController

    layout 'nobanner'

    def home
      @listings = Listing.all
    end

end
