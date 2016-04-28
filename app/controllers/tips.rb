get '/tips' do
  @tips = Tip.all
  @category = "All"
  erb :"tips/show"
end

get '/categories/:id/tips' do
  @category = Category.find(params[:id])
  # p @category
  @tips = @category.tips
  # p @tips
  erb :"tips/show"
end

get '/tips/new' do
  @categories = Category.all
  erb :"tips/new"
end

post '/tips' do
  Tip.create(params[:tip])
  redirect '/tips'
end

# get '/category/:id/article/:art_id' do
#   # @article = @category.tips.find(params[])
#   @category = Category.find(params[:id])
#   # p @category
#   @tips = @category.tips.find(params[:art_id])
#   p @tips
#   erb :"tips/one_item"
# end