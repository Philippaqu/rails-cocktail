class DosesController < ApplicationController

  def show
    @dose = Dose.find(params[:cocktail_id])

  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    #redirect_to cocktail_path
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.new(dose_params)
    @dose.save
    redirect_to cocktail_path
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktails_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end

end
