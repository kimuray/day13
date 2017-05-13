class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if params[:back]
      render :new
    elsif @contact.save
      redirect_to new_contact_url, notice: 'お問い合わせありがとうございました'
    else
      render :new
    end
  end

  private

  def contact_params
    if params[:back]
      params.require(:contact).permit(:name, :email, :content)
    else
      params.require(:contact).permit(:name, :email, :content, :confirming)
    end
  end
end
