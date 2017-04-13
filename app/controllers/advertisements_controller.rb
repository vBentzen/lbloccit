class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    def create
      @advertisement = Advertisement.new
      @advertisement.title = params[:advertisement][:title]
      @advertisement.body = params[:advertisement][:body]

      if @advertisement.save
        flash[:notice] = "Ad was saved."
        redirect_to @advertisement
      else
        flash.now[:alert] = "There was an error saving the post. Please try again."
        render :new
      end
    end
  end
end
