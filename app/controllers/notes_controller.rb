class NotesController < ApplicationController
  respond_to :json

  def create
    note = Note.new(params[:note])
    note.save
    respond_with note
  end

  def update
    note = Note.find(params[:id])
    note.update_attributes(params[:note])
    respond_with note
  end
end
