class EntriesController < ApplicationController
    def index
        @entries = Entry.order(date: :desc)
    end
    
    def show
        @entry = Entry.find(params[:id])
    end
    
    def new
    end
    
    
    def create
      entry = Entry.create(entry_params)
      redirect_to(entry_path(entry))
    end
    
    def edit
        @entry = Entry.find(params[:id])
    end
    
    def update
      entry = Entry.find(params["id"])
      entry.update(entry_params)
      redirect_to(entry_path(entry))
    end
    
    def destroy
       entry = Entry.find(params[:id])
       entry.destroy
       redirect_to entries_path
    end
    
    private

    def entry_params
      params.require(:entry).permit(:title, :contents)
    end
end
