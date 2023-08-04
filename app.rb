require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
get("/square/new") do
  erb(:square_calc)
end
get("/square/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 2
  erb(:square_results)
end
get("/square_root/new") do
  erb(:square_root_calc)
end
get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 0.5
  erb(:square_root_results)
end
get("/payment/new") do
  erb(:payment)
end
get("/payment/results") do
  @number_of_periods = params.fetch("user_years")
  @number_of_months = @number_of_periods.to_f * 12
  @apr = params.fetch("user_apr").to_f
  @r = @apr / 1200
  @apr = @apr.to_fs(:percentage, { :precision => 4 })
  @principal = params.fetch("user_pv").to_f
  @numerator = @r*@principal
  @principal = @principal.to_fs(:currency)
  @denominator = (1-(1/((1+@r)**@number_of_months )))
  @payment = (@numerator/@denominator).to_fs(:currency)
 
  erb(:payment_results)
end

get("/random/new") do
  erb(:random_new)
end
get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f
  @rand = rand(@min...@max)
  erb(:random_results)
end
