class Food

  attr_accessor :id, :ingredient, :spice, :measurement
  
  def initialize(hash)
    @id = hash['id']
    @ingredient = hash['ingredient']
    @spice = hash['spice']
    @measurement = hash['measurement']
  end

  def self.find(id)
    food_hash = Unirest.get("http://localhost:3000/api/v2/foods/#{id}.json", :headers => {"Accept"=>"application/json", "X-User-Email"=>"ged@ged.com", "Authorization"=>"Token token=123_cba"}).body
    @food = Food.new(food_hash)
  end

  def self.all
    foods = Unirest.get("http://localhost:3000/api/v2/foods.json", :headers => {"Accept"=>"application/json", "X-User-Email"=>"ged@ged.com", "Authorization"=>"Token token=123_cba"}).body  
    @foods = []
      foods.each do |food|
        @foods << Food.new(food)
      end
    return @foods
  end

  def self.create(ingredient, spice, measurement)
    Unirest.post("http://localhost:3000/api/v1/employees.json", :headers => {"Accept"=> "application/json"}, :parameters => {:ingredient => params[:ingredient], :spice => params[:spice], :measurement=> params[:measurement]}).body
  end

  def self.update(ingredient, spice, measurement)
    Unirest.patch("http://localhost:3000/api/v2/foods/#{id}.json")
  end




end
