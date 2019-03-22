class AnimalsController < ApplicationController
    def index
        @animal = Animal.all
        puts @animal
    end
    
    def new
        @animal = Animal.new
    end
    
    def create
        @animal = Animal.new(animal_params)
        if @animal.valid?
            @animal.save
            flash.now[:alert]= "#{@animal.name} has been Saved!"
            redirect_to '/animals'
            
        else 
            @errors = @animal.errors.full_messages
            render 'new'
        end
    end
    
    
    def edit 
        @animal = Animal.find(params[:id])
    end
    
    
    def update
        @animal = Animal.find(params[:id])
        if @animal.update(animal_params)
            redirect_to '/animals'
        else
            @errors = @animal.errors.full_messages
            render 'new'
        end
    end
    
    def show
        @animal = Animal.find(params[:id])
    end
    
    def destroy
        @animal = Animal.destroy(params[:id])
        redirect_to '/animals'
    end 
    
    private
    
    def animal_params
        params.require(:animal).permit(:name, :latin_name, :kingdom)
    end
end