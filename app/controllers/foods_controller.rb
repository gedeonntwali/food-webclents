class FoodsController < ApplicationController

  def index
    @foods = Unirest.get("http://localhost:3000/api/v2/foods.json").body    
  end

  def show
    food_hash = Unirest.get("http://localhost:3000/api/v2/foods/#{params[:id]}.json").body
    @food = Food.new(food_hash)
  end

  def new
  end

  def create
    @food = Unirest.post("http://localhost:3000/api/v1/employees.json", :headers => {"Accept"=> "application/json"}, :parameters => {:ingredient => params[:ingredient], :spice => params[:spice], :measurement=> params[:measurement]}).body
    redirect_to "/foods/#{@food['id']}"
  end

  def edit
    @food = Unirest.get("http://localhost:3000/api/v2/foods/#{params[:id]}.json", :headers => {"Accept"=> "application/json"}, :parameters => {:ingredient => params[:ingredient], :spice => params[:spice], :measurement=> params[:measurement]}).body
  end


  def update
    @food = Unirest.patch("http://localhost:3000/api/v2/foods/#{params[:id]}.json", :headers => {"Accept"=> "application/json"}, :parameters => {:ingredient => params[:ingredient], :spice => params[:spice], :measurement=> params[:measurement]}).body
    render :show
  end
  
  def destroy
    @food = Food.find_by(id:params[:id])
    @food.destroy
    render json: {message: "food deleted!!!!!"}
  end

end
