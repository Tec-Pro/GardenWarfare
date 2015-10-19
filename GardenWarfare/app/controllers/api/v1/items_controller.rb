class Api::V1::ItemsController < ApplicationController

  
  def index
    @item = Item.all
  end

  def show    
     @item = Item.find(params[:id])
  end

  def create
     #@character = @current_user.character(my_character_params_create)
     @item = Item.new();
     @item.type = "weapon";
     @item.name = "sword";
     if @item.save
      render "api/v1/items/show" #ACA PASARIA A EL INVENTARIO
    else
      render json: { errors: "error"}, status: :unprocessable_entity   
    end
  end

  def update 
    @item.update(my_character_params_update)
    render "api/v1/items/show" #ACA IRIA LA PAGINA DE DONDE VENGA LA ACTUALZIACION, SE PUEDE DIVIDIR EN VARIOS METODOS
  end

  def destroy    
    @item.destroy
    render json: { message: "Fue eliminado"  }   
  end

end