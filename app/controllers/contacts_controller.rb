class ContactsController < ApplicationController
  
  def new
  end

  def create
    @contact = Contact.new(contact_params)
    
    if @contact.valid?
      @contact.save
      redirect_to action: "new"
      flash[:success] = "The message successfully send"
    else
      render action: "new"
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

end
