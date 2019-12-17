require ("sinatra")
require ("sinatra/reloader")
require ("./lib/riddle")
require ("pry")
also_reload("lib/**/*.rb")

get ("/") do
  @riddles = Riddle.all
  erb(:riddles)
end

get ("/riddles") do
  @riddles = Riddle.all
  erb(:riddles)
end


get ('/riddles/new') do
  erb(:new_riddle)
end

get('/riddles/:id') do
  @riddle = Riddle.find(params[:id].to_i())
  if params[:user_answer]==@riddle.answer
    @riddle.correct = true
  else
    @riddle.correct = false
  end
  erb(:riddle)
end

# get('/riddles/:id/user_answer/:answer') do
#   @riddle = Riddle.find(params[:id].to(i))
#   erb(:answer)
# end

post("/riddles") do
  name = params[:name]
  question = params[:question]
  answer = params[:answer]
  riddle = Riddle.new(name, nil, question, answer)
  riddle.save()
  @riddles = Riddle.all()
  erb(:riddles)
end
