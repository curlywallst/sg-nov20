class PostsController < ApplicationController
    
    get '/posts' do
        @posts = Post.all
        erb :'posts/index'
    end

    get '/posts/new' do
        @users = User.all
        erb :'posts/new'
    end

    post '/posts' do
        user = User.find_by(id: params[:user_id])
        post = user.posts.build(params)
        if post.save
            redirect "/posts"
        else
            redirect "posts/new"
        end
    end

    get '/posts/:id' do
        @post = Post.find_by(id: params[:id])
        if @post
            erb :'posts/show'
        else
            redirect '/posts'
        end
    end

    get "/posts/:id/edit" do
        @users = User.all
        @post = Post.find_by(id: params[:id])
        erb :'posts/edit'
    end

    patch "/posts/:id" do
        @post = Post.find_by(id: params[:id])
        if @post.update(title: params[:title], body: params[:body])
            redirect "/posts/#{@post.id}"
        else
            redirect "/posts/#{@post.id}/edit"
        end
    end

    delete "/posts/:id" do
        @post = Post.find_by(id: params[:id])
        @post.delete
        redirect "/posts"
    end
end