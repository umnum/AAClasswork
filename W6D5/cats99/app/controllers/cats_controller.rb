class CatsController < ApplicationController

    # GET http method for '/cats/'
    def index
        @cats = Cat.all
        render :index
    end

    #GET http method for '/cat/id'
    def show
        @cat = Cat.find(params[:id])
        render :show
    end
    #GET http method for '/cat/new'
    def new

    end

    #GET http method for '/cats/new'
    def new 
        @cat = Cat.new
        render :new
    end

    #POST http method for '/cats'
    def create
        @cat = Cat.new(cat_params)
        if @cat.save
            redirect_to cat_url(@cat)
        else
            render json: @cat.errors.full_messages, status: 422 # unprocesable entity
        end
    end

    #GET http method for '/cats/:id/edit'
    def edit
        @cat = Cat.find(params[:id])
        render :edit
    end

    #PATCH http method for '/cat/:id'
    def update
        @cat = Cat.find(params[:id])
        if @cat.update(cat_params)
            redirect_to cat_url(@cat)
        else
            render json: @cat.errors.full_messages, status: 422 # unprocesable entity
        end
    end

    def destroy
        Cat.find(params[:id]).destroy
        redirect_to cats_url
    end


    protected

    def cat_params
        params.require(:cat).permit(:birth_date, :name, :color, :sex, :description)
    end
end



# Prefix      Verb   URI Pattern                            Controller#Action
# cats        GET    /cats(.:format)                          cats#index
#             POST   /cats(.:format)                          cats#create
# new_cat     GET    /cats/new(.:format)                      cats#new
# edit_cat    GET    /cats/:id/edit(.:format)                 cats#edit
# cat         GET    /cats/:id(.:format)                      cats#show
#             PATCH  /cats/:id(.:format)                      cats#update
#             PUT    /cats/:id(.:format)                      cats#update
#             DELETE /cats/:id(.:format)                      cats#destroy