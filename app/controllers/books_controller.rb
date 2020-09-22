class BooksController < ApplicationController
    def index
        @books=Book.all 
        @books=@books.where(title:params[:title]) if params[:title].present?
    end

    def show
        @book=Book.find(params[:id])
    end

    def new
        @book=Book.new
    end

    def create
        book_params=params.require(:book).permit(:title,:review,:content)
        @book=Book.new(book_params)
        if @book.save
            redirect_to books_path
        else 
            render:new
        end
    end

    def edit
        @book=Book.find(params[:id])
    end

    def update
        @book=Book.find(params[:id])
        book_params=params.require(:book).permit(:title,:review,:content)
        if @book.update(book_params)
            redirect_to books_path
        else
            render :edit
        end
    end

    def destroy
        Book.find(params[:id]).destroy
        redirect_to books_path
    end
end
