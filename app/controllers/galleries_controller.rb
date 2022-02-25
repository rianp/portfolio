class GalleriesController < ApplicationController
    def index
        @gallery_items = Gallery.all 
    end

    def new
        @gallery_item = Gallery.new
    end

    # POST /galleries
def create
    @gallery = Gallery.new(params.require(:gallery).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to galleries_path, notice: "gallery was successfully created." }
        format.json { render :show, status: :created, location: @gallery }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
