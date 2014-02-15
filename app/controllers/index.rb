get '/' do
  @categories = Category.all
  erb :index
end

get '/create_category' do
  erb :create_category
end

post '/create_category' do
  Category.create(title: params[:title])

  redirect '/'
end

get '/categories/:id/posts/new' do
  @category_id = params[:id]
  erb :create_post
end

post '/categories/:id/posts/new' do
  post = Post.create(title: params[:title],
              price: params[:price],
              description: params[:description],
              location: params[:location],
              email:  params[:email],
              category_id: params[:id])

  redirect "/posts/#{post.id}"
end

get '/categories/:id' do
  @category_id = params[:id]
  @category = Category.find(params[:id]).posts
  erb :category_posts
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :view_posts
end

get '/posts/:id/edit' do
  @post = Post.find(params[:id])

  erb :edit_post
end

post '/posts/:id/edit' do
  post = Post.find(params[:id])
  post.update(title: params[:title],
              price: params[:price],
              description: params[:description],
              location: params[:location],
              email: params[:email])
  redirect "/posts/#{params[:id]}"

end

post '/posts/:id/delete' do
  post = Post.find(params[:id])
  puts "============== This is the category id! =============="
  p post.category_id
  Post.destroy(params[:id])

  redirect ""
  # redirect to all the posts in that category
end

# Need to 'destroy' a post
# View postings in a category
