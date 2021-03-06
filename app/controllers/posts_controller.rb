class PostsController < ApplicationController
  before_filter :authorize, :except => [:index, :show]
  
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.where(:published => true).paginate(:page => params[:page], :per_page => 4).order("published_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  	if params.include?(:title)
  		title = params[:title]
  		ep = title.match(/episode-\d+/).to_s
  		id = ep.match(/\d+/).to_s
  	else
  		id = params[:id]
  	end
  	
    begin
    	if admin?
    		@post = Post.find(id)
    	else
    		@post = Post.where(:published => true).find(id)
    	end
    rescue ActiveRecord::RecordNotFound
    	redirect_to root_url
    	return
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    @post.build_enclosure

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    
    if @post.enclosure.nil?
    	@post.build_enclosure
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save     	
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :ok }
    end
  end
end
