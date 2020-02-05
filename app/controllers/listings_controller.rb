class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]


  layout 'nobanner', :only => [:index]

  def index
    listingtype= listing_type.safe_constantize
    #@listings = Listing.all
    @listings = listingtype.all
  end

  
  def show
  end

 
  def new
    @listing = Listing.new
  end

 
  def edit
  end


  def create

    listingtype = listing_params[:type].safe_constantize
    @listing = listingtype.create(listing_params)

    if @listing.valid?
      flash[:success] = t 'listingcreated' 
      redirect_to @listing.becomes(Listing)
    else
      flash.now[:alert] = t 'listingnotcreated'
      render 'listings/new'
    end

  end

  def update  
    if @listing.update(listing_params)
      flash[:success] = t 'listingupdated'
      redirect_to @listing.becomes(Listing)
    else
      flash.now[:alert] = t 'listingnotupdated'
      render :edit
    end

  end

  def destroy
    @listing.destroy
    redirect_to listings_url, notice: 'Listing has been destroyed'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def listing_type
      listing_type = Listing.listing_types.include?(params[:type]) ?  params[:type] : "Listing"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(listing_type.underscore.to_sym).permit(:type, :title, :description, :image)
    end
end
