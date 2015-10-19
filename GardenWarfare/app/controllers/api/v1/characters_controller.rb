class Api::V1::CharactersController < ApplicationController

  before_action :authenticate, only: [:create,:update,:destroy]
  before_action :set_character, only: [ :show,:update,:destroy ]


  def index
    @characters = Character.all
  end

  def show    
     @character = Character.find(params[:id])
  end

  def create
     #@character = @current_user.character(my_character_params_create)
     @character = Character.new(my_character_params_create);
     @character.user = @current_user;
     @character.strength = 5;
     @character.vitality = 5;
     @character.dexterity = 5;
     @character.level = 1;
     @character.experience = 0;
     @character.inventoryCapacity = 20;
     @character.money = 200;
     @character.blueMoney = 0;
     if @character.save
      render "api/v1/characters/show" #ACA PASARIA A EL INVENTARIO
    else
      render json: { errors: "error"}, status: :unprocessable_entity   
    end
  end

  def update 
    @character.update(my_character_params_update)
    render "api/v1/characters/show" #ACA IRIA LA PAGINA DE DONDE VENGA LA ACTUALZIACION, SE PUEDE DIVIDIR EN VARIOS METODOS
  end

  def destroy    
    @character.destroy
    render json: { message: "Fue eliminado"  }   
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def my_character_params_create
    params.require(:character).permit(:type, :name)
  end

  def my_character_params_update
    params.require(:character).permit(:money, :blueMoney, :strength, :vitality, :dexterity,:level, :experience, :inventoryCapacity)
  end
  

end
