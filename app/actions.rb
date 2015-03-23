# Homepage (Root path)
get '/' do
  # erb :index
end

get '/messages' do
    @messages = Message.all
  erb :'messages/index'
end

get '/messages/new' do
  @message = Message.new
  erb :'messages/new'
end

post '/messages/new' do
  @message = Message.new(
    url: params[:url],
    content: params[:content],
    author:  params[:author]
  )
  if @message.save
    redirect '/messages'
  else
    erb :'messages/new'
  end
end

get '/messages/:id' do
  @message = Message.find params[:id]
  @all_messages =  []
  erb :'messages/show'
end

get '/show_all' do
  @messages = Message.where(author: params[:all?])
  erb :'messages/show_all'
end