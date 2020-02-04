class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  # GET /listings
  def index
    listingtype= listing_type.safe_constantize
    #@listings = Listing.all
    @listings = listingtype.all
  end

  # GET /listings/1
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  def create
    #@listing = Listing.new(listing_params)

    #respond_to do |format|
    #  if @listing.save
    #    format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
    #  else
    #    format.html { render :new }
    #  end

    listingtype = listing_params[:type].safe_constantize
    @listing = listingtype.create(listing_params)

    if @listing.valid?
      flash[:success] = t 'listingcreated' 
      redirect_to @listing.becomes(Listing)
    else
      flash.now[:alert] t 'listingnotcreated'
      render 'listings/new'
    end

  end

  # PATCH/PUT /listings/1
  def update
    #respond_to do |format|
    #  if @listing.update(listing_params)
    #    format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
    #  else
    #    format.html { render :edit }
    #  end
    #end
    
    if @listing.update(listing_params)
      flash[:success] = t 'listingupdated'
      redirect to @listing.becomes(Listing)
    else
      flash.now[:alert] = t 'listingnotupdated'
      render :edit
    end

  end

  # DELETE /listings/1
  def destroy
    @listing.destroy
    redirect_to listings_url, notice t 'listingdestroyed'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def listing_type
      listing_type = Listing.listing_types.include?(params[:type]) ? : params[:type] : "Listing"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(listing_type.underscore.to_sym).permit(:title, :description, :type, :image)
    end
end
