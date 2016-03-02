require("sinatra")
require("sinatra/contrib/all") if development?
require_relative("./models/shoe")


get"/shoe/new" do
  erb(:new)
end

post"/shoe" do 
  puts "PARAMS"
  puts params
  @shoe=Shoe.new(params)
  @shoe.save
  erb(:create)
end

get "/shoe"do
@shoes = Shoe.all
erb(:index)
end