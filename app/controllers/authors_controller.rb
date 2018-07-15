class AuthorsController < ApplicationController
    def index
        @authors = Author.all
        @author = Author.new
    end

    def show
        @author = Author.find(params[:id])
    end

    def new
        @author = Author.new
    end

    def edit
        @author = Author.new
    end

    def update
        @author = Author.new(author_params)
        if @author.update(author_params)
            redirect_to authors_path, notice: 'Author was updated'
        else
            render :new
        end
    end

    def destroy
        @author = Author.find(params[:id])
        if @author.destroy
            redirect_to authors_path, notice: 'Author was deleted'
        else
            redirect_to authors_path, alert: 'There was an error, try again'
        end
    end

    def create
        @author = Author.new(author_params)
    end

    private

    def author_params
        params.require(:author).permit(:name, :surname, :age)
    end
end