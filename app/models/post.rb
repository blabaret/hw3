class Post < ApplicationRecord
  # talks to the "posts" table
  def index
    @posts = Post.all
  end

  def new
    @posts = Post.new
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
  end

  def create
    @posts = Post.new
    @posts["title"] = params["posts"]["title"]
    @posts["body"] = params["posts"]["body"]
    @posts["date"] = params["posts"]["date"]
    @posts.save
    redirect_to "/posts"
  end

end
