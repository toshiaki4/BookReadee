class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show edit update destroy ]
  # before_action :admin_only, only: %i[ index show ]
  # GET /contacts or /contacts.json
  def index

    @contacts = Contact.all
  end

  # GET /contacts/1 or /contacts/1.json
  def show

    @contact = Contact.find(params[:id])
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])
  end

  # POST /contacts or /contacts.json
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      #ContactMailer.contact_mail(@contact).deliver
      redirect_to new_contact_path,notice: 'Contact was successfully created.'
    end
  end

  # PATCH/PUT /contacts/1 or /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: "Contact was successfully updated." }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1 or /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: "Contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # def admin_only
    #   if user_signed_in?
    #     raise ActionController::RoutingError
    #   end
    # end


    # Only allow a list of trusted parameters through.
    def contact_params
      # params.permit(:name, :email, :content)
      params.require(:contact).permit(:name, :email, :content)
    end
end
