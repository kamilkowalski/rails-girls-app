class EntriesController < ApplicationController
    def index
        @entries = Entry.order(date: :desc)
    end
    
    def show
        @entry = Entry.find(params[:id])
    end
end
