class NotesController < ApplicationController
  before_filter :authorize!

  respond_to :json

  def create
    note = current_user.notes.create params[:note]
    respond_with note
  end

  def update
    note = current_user.notes.find(params[:id])
    note.update_attributes(params[:note])
    respond_with note
  end

  def destroy
    current_user.notes.destroy(params[:id])
    render text: '{}'
  end
end
