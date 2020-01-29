class PagesController < ApplicationController

  layout 'nobanner', :only => [:home]

    def home
      @listings = Listing.all
    end

    def about
    end

end
