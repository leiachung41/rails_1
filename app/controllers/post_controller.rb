class PostController < ApplicationController
  before_action :authenticate_user!, except: [ :list ]
  
  ### CREATE START
  def create
    _title = params[:title]
    _contents = params[:contents]
    
    _lat = params[:lat]
    _lng = params[:lng]
    _address = params[:address]
    
    post = Post.new(title: _title, contents: _contents)
    post.user = current_user
    post.lat = _lat
    post.lng = _lng
    post.address = _address
    
    post.save
    
    redirect_to controller:'post', action:'list'
  end

  def new

  end
  ### CREATE END
  
  ### READ
  def list
    @posts = Post.all.paginate(page: params[:page], per_page: 5)
  end
  
  ### UPDATE
  def edit
    _id = params[:id]
    @post = Post.find(_id)
    
    authorize_action_for @post
  end
  
  def update
    # create 참고해서 update에도 latlng 구현하기.
    _id = params[:id]
    _title = params[:title]
    _contents = params[:contents]
    
    post = Post.find(_id)
    authorize_action_for post
    
    post.title = _title
    post.contents = _contents
    
    post.save
    
    redirect_to controller: 'post', action: 'list'
  end
  
  ### DELETE
  def delete
    _id = params[:id]
    
    post = Post.find(_id)
    authorize_action_for post
    
    post.destroy
    
    redirect_to controller:'post', action:'list'
  end
  
end
