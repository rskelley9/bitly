get '/' do
  # Look in app/views/index.erb
 
  @url = Url.find(:all, :order => "id desc", :limit => 5)
  # @url = Url.all
  erb :index
end

post '/urls' do
  # create a new Url
  @url_new = Url.new(original: params[:long], click_count: 0)
  
  if @url_new.save
    erb :succes_page
  else
    @error = @url_new.errors.messages[:original][0]
    @url = Url.find(:all, :order => "id desc", :limit => 5)
    erb :index
  end

end

# e.g., /q6bda
get '/:short_url' do

  url = Url.find_by_updated(params[:short_url])
  redirect to(url.original)
  # redirect to appropriate "long" URL
end
