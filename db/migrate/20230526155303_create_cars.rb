class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :marque
      t.string :modele
      t.string :version
      t.integer :annee
      t.integer :prix
      t.string :date_mise_en_circulation
      t.string :genre
      t.string :energie
      t.integer :puissance_fiscale
      t.integer :kilometrage
      t.integer :puissance_chevaux
      t.integer :nb_places
      t.integer :nb_portes
      t.string :couleur
      t.string :boite_de_vitesse
      t.integer :nb_rapports
      t.string :garantie
      t.string :categorie

      t.timestamps
    end
  end
end
