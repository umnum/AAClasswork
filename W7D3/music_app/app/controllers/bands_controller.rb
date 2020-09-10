class BandsController < ApplicationController
    def index
        @bands = Band.all
        render :index
    end

    def create
        @band = Band.new(band_params)
        if @band.save
            redirect_to band_url(@band)
        else
            flash.now[:errors] = ["Name can't be blank"]
            render :new
        end
    end
    
    def new
        render :new
    end

    def edit
        @band = Band.find(params[:id])
        if @band 
            render :edit 
        end
    end

    def show
        @band = Band.find(params[:id])
        render :show
    end

    def update
        @band = Band.find(params[:id])
        if @band.update(name: band_params[:name])
            redirect_to band_url(@band)
        else
            flash.now[:errors] = ["Name can't be blank."]
            render :edit
        end
    end

    def destroy
        @band = Band.find(params[:id]).destroy
        redirect_to bands_url
    end

    def band_params
        params.require(:band).permit(:name)
    end
end
