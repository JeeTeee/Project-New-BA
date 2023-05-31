class CarsController < ApplicationController

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  private

  def car_params
    params.require(:car).permit(
      :marque,
      :modele,
      :version,
      :annee,
      :prix,
      :date_mise_en_circulation,
      :genre,
      :energie,
      :kilometrage,
      :puissance_chevaux,
      :puissance_fiscale,
      :nb_places,
      :nb_portes,
      :couleur,
      :boite_de_vitesse,
      :nb_rapports,
      :garantie,
      :categorie,
      photos: []
    )
  end
end
