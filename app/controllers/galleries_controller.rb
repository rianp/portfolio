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
  
  def edit
    @gallery_item = Gallery.find(params[:id])
  end

  # PATCH/PUT /galleries/1 or /galleries/1.json
  def update
    @gallery_item = Gallery.find(params[:id])
    
    respond_to do |format|
      if @gallery_item.update(params.require(:gallery).permit(:title, :subtitle, :body))
        format.html { redirect_to galleries_path, notice: 'The record successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @gallery_item = Gallery.find(params[:id])
  end

  def destroy
    # Perform the lookup
    @gallery_item = Gallery.find(params[:id])

    # Destroy/delete the record
    @gallery_item.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to galleries_url, notice: 'Record was removed.' }
    end
  end

end
