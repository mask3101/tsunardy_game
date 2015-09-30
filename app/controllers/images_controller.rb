class ImagesController < ApplicationController

before_action :set_image, only: [:show, :edit, :update, :destroy]

def index
    @images = Image.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @imgquest = Image.find(params[:id])
    if @imgquest.data && @imgquest.mime_type && @imgquest.filename
     # send_data(@imgquest.data, :type => @imgquest.mime_type, :filename => @imgquest.filename,
      #        :disposition => 'inline')
    
    send_data @imgquest.data, :type => @imgquest.mime_type, :disposition => 'inline'
    end
  end


  # GET /categories/new
  def new
    @image = Image.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @image = Image.new(Image_params)
    if @Image.save
      flash[:notice] = "La categoria se ha creado."
      redirect_to new_image_path
    else
      flash[:error] = "La categoria no se pudo crear."
      render :new
    end

  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @Image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @Image }
      else
        format.html { render :edit }
        format.json { render json: @Image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:data)
      #params[:question]
    end
end