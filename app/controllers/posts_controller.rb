class ContactsController < ApplicationController

    def show
      @post = Posts.find_by({ "id" => params["id"] })
      @place = Place.find_by({ "id" => @contact["place_id"] })
    end
  
    def new
      @post = Post.new
      @place = Place.find_by({ "id" => params["place_id"] })
      @post["place_id"] = @place["id"]
    end
  
    def create
      @post = Post.new
      @post["title"] = params["contact"]["title"]
      @post["body"] = params["contact"]["body"]
      @post["date"] = params["contact"]["date"]
      @post.save
      redirect_to "/places/#{@post["place_id"]}"
    end
  
  end
  