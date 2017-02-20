class FoodsController < ApplicationController

  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
  end

  def create
    @food = Food.create(params[:ingredient], params[:spice], params[:measurement])
    redirect_to "/foods/#{@food['id']}"
  end

  def edit
    @food = Unirest.get("http://localhost:3000/api/v2/foods/#{params[:id]}.json", :headers => {"Accept"=> "application/json"}, :parameters => {:ingredient => params[:ingredient], :spice => params[:spice], :measurement=> params[:measurement]}).body
  end


  def update
    @food = Food.update(params[:ingredient], params[:spice], params[:measurement])
  redirect_to "/foods/#{params[:id]}"
  end
  
  def destroy
    @food = Food.delete(params[:id])

  end

end
