require './config/environment'
require './app/models/sample_model'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    return erb :index
  end
  
  post '/result' do
    points_array = params.values
    total = 0 
    
    points_array.each do |point|
      total += point.to_i 
    end
    
    result = calculate_result(total)
    
    if result == "bffs"
      return erb :bff
    elsif result == "okay"
      return erb :okay
    else 
      return erb :nope
    end #ends if statement
    
  end #ends post
  
end #ends entire class of application
