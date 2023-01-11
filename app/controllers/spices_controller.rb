class SpicesController < ApplicationController
      # GET /spices
   def index 
    spices = Spice.all 
    render json: spices, status: :ok
   end
     #POST /spices
   def create 
    spice = Spice.create(spice_params)
    render json: spice, status: :created
   end

   def update
    spice = find_spice 
    spice.update!(spice_params)
    render json: spice, status: :accepted
   end
   def destroy 
    spice = Spice.find(params[:id])
    spice.destroy 
    head :no_content
   end
   private 
   def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
   end

   def find_spice 
    Spice.find_by(id: params[:id])
   end
end
