class CarsController < ApplicationController
  # On ne demande pas d'authentification pour accéder à la page index
  # Pas de methodes new et create celà pourrait être implémenté plus tard

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
