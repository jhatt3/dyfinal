class ContactsController < ApplicationController
  before_action :all_contacts, only: [:index, :create]
  before_action :set_contact, only: [:edit, :update, :destroy]

  
  # So what's going on here? First, we expose the sort_column and sort_direction methods to our helpers. 
  # This allows us to utilize them outside the controller. Next, the index method orders by our current sort column 
  # (specified by the sort_column method) and direction (specified by the sort_direction method). If you take a 
  # look at the sort_column method you'll see that it checks the column names against a white list of column names.
  # This prevents the user from sorting by columns we may not wish to have them sort by, id for instance. The sort
  # direction method checks to make sure the direction is either asc or desc. Both methods return sensible defaults 
  # otherwise. This helps keep the user from doing unexpected things with your data. 
  helper_method :sort_column, :sort_direction

  # GET /contacts
  # GET /contacts.json


  # contacts = Contact.search(params[:term]).page(params[:page]).per(15)
  # @contacts = contacts.order("#{sort_column} #{sort_direction}")
  def all_contacts
    @contacts = Contact.all
    @contacts = Contact.order("#{sort_column} #{sort_direction}")
  end


  # GET /contacts/new
  def new
    @contact = Contact.new
    @categories = Category.all
  end

  # GET /contacts/1/edit
  def edit
    @categories = Category.all    
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)
    @categories = Category.all


    respond_to do |format|

  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # search methods to search by category or name
  def contacts_by_name
    @contacts = Contact.where(name: params[:name])
    @name = params[:name]
  end

  def contacts_by_category
    @contacts = Contact.where(category_id: params[:category_id])
    @categories = Category.where(params[:category])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    #sorting methods
    def sortable_columns
      ["Name"]
    end
  
    def sort_column
      sortable_columns.include?(params[:column]) ? params[:column] : "name"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email, :address, :city, :state, :zip, :phone, :category, :remarks, :category_id, :latitude, :longitude)
    end
end
