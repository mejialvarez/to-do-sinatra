require 'make_todo'
require 'sinatra'

get '/' do
  redirect '/tasks'
end

get '/tasks' do
  @tasks = Tarea.all

  if params[:done] == "true"
    @tasks.select! { |t| t["done"]==true }
  else
    @tasks.select! { |t| t["done"]==false }
  end

  erb :index
end

get '/tasks/new' do
  erb :_new
end

post '/tasks' do
  Tarea.create(params[:title])
  redirect '/tasks?done=false'
end

put '/tasks/:id' do
  Tarea.update(params[:id])
  redirect '/tasks?done=true'
end

delete '/tasks/:id' do
  Tarea.destroy(params[:id])
  redirect '/tasks?done=false'
end
