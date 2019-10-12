class UserController < ApplicationController
    def detail
        @user=User.find_by(id:params[:id])
    end
    def create
        @user=User.new(email:params[:email],
                       name:params[:name],
                       password:params[:password],
                       image:"user-shape.png")
        @user.save
        redirect_to("/home")
    end
    def signup
        
    end
    
    
    def login_form
    end

    def login
        @user=User.find_by(email:params[:email])
        if @user&&@user.authenticate(params[:password])
            session[:user_id]=@user.id
            redirect_to("/home")
        else
            redirect_to("/user/login")
            
        end
    end
    def logout
        session[:user_id]=nil
        redirect_to("/home")
    end

    def index
        @users=User.all
    end

    def edit
        @user=User.find_by(id:params[:id])
    end

    def update
        @user=User.find_by(id:params[:id])
        @user.self_intro=params[:self_intro]
        @user.image="#{@user.id}.jpg"
        image=params[:image]
        if image
            File.binwrite("public/#{@user.image}",image.read)
        end
        @user.age=params[:age]
        @user.contact=params[:contact]
        @user.sex=params[:sex]
        @user.hobby=params[:hobby]
        @user.save
        redirect_to("/home")
    end

    def ensure_correct_user
        @user=User.find_by(id:params[:id])
        if @user!=@current_user
            redirect_to("/")
        end
    end
end
