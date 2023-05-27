# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Nettoyage de la DB..."

Car.destroy_all

puts "Création des voitures..."

prix_random = (((rand * (40_000 - 10_000)) + 10_000) / 1000).round * 1000
prix_random += 1000 - 10

energies = ["Diesel", "Essence"]
couleurs = ["NOIR", "GRIS", "BLANC", "ROUGE", "BLEU", "VERT", "JAUNE"]
boite_de_vitesse = ["Manuelle", "Automatique"]
# faire un hash clé valeur avec la puissance fiscale en clé et la puissance chevaux en valeur
# puissance_chevaux = [100, 120, 130]
# puissance_fiscale = puissance_chevaux == 100 ? 5 : 6
puissances = { puissance_chevaux: [100, 120, 130], puissance_fiscale: [5, 6] }




data_marques = [
  {
    marque:"Peugeot",
    modeles: ["208", "308", "2008", "3008", "5008", "508", "Rifter"],
    versions: ["Allure", "Active", "Style", "GT Line", "Roadtrip", "GT"]
  },
  {
    marque:"Citroën",
    modeles: ["C1", "C3", "C3 Aircross", "C4 Cactus", "C4 SpaceTourer", "C5 Aircross"],
    versions: ["Live", "Feel", "Shine", "Business", "Urban Ride"]
  },
  {
    marque:"Renault",
    modeles: ["Clio", "Captur", "Megane", "Scenic", "Kadjar", "Talisman", "Espace", "Koleos"],
    versions: ["Life", "Zen", "Intens", "Business", "Limited", "Série Limitée"]
  },
  {
    marque:"Volkswagen",
    modeles: ["Polo", "Golf", "T-Roc", "T-Cross", "Tiguan", "Touran", "Sharan", "Passat", "Arteon"],
    versions: ["Trendline", "Confortline", "Carat", "Business", "R-Line"]
  }
]

max = 10
count = 0

data_marques.each do |info_marque|
  marque = info_marque[:marque]
  modeles = info_marque[:modeles]
  versions = info_marque[:versions]

  modeles.each do |modele|
    versions.each do |version|

      annee = rand(2016..2023)
      garantie =
        if annee >= 2022
          "Constructeur"
        elsif annee >= 2019
          "Garantie 12 mois"
        elsif annee <= 2017
          "Garantie 6 mois"
        else
          "Garantie 8 mois"
        end

      puissance_chevaux = puissance[:puissance_chevaux].sample

      puissance_fiscale =
        case puissance_chevaux
        when 100
          puissances[:puissance_fiscale][0]
        when 120 || 130
          puissances[:puissance_fiscale][1]
        end

      Car.create!(
        marque: marque,
        modele: modele,
        version: version,
        annee: annee,
        prix: prix_random,
        date_mise_en_circulation: "15/10/2019",
        genre: "Véhicule Particulier",
        energie: energies.sample,
        kilometrage: rand(10..120_000),
        puissance_chevaux: puissance_chevaux.sample,
        puissance_fiscale: puissance_fiscale,
        nb_places: 5,
        nb_portes: 5,
        couleur: couleurs.sample,
        boite_de_vitesse: "Boite #{boite_de_vitesse.sample}",
        nb_rapports: 6,
        garantie: garantie,
        categorie: "TOUT-TERRAIN"
      )

      count += 1
      break if count >= max
    end
    break if count >= max
  end
  break if count >= max
end

# Car.create!(
#   marque: marques.sample,
#   modele: "208",
#   version: "Allure 1.2 Puretech 100",
#   annee: rand(2018..2023),
#   prix: prix_random,
#   date_mise_en_circulation: "15/10/2019",
#   genre: "Véhicule Particulier",
#   energie: "Diesel",
#   puissance_fiscale: 5,
#   kilometrage: rand(10..120_000),
#   puissance_chevaux: 100,
#   nb_places: 5,
#   nb_portes: 5,
#   couleur: "NOIR",
#   boite_de_vitesse: "manuelle",
#   nb_rapports: 6,
#   garantie: "PREMIUM- 12",
#   categorie: "TOUT-TERRAIN"
# )


puts "Voitures créées !"
# car = Car.new(
#   marque: marques.sample,
#   modele: "208",
#   version: "Allure 1.2 Puretech 100",
#   annee: rand(2018..2023),
#   prix: 14_990,
#   date_mise_en_circulation: "15/10/2019",
#   genre: "Véhicule Particulier",
#   energie: "Diesel",
#   Puissance_fiscale: 5,
#   kilometrage: rand(10..120_000),
#   puissance_chevaux: 100,
#   nb_places: 5,
#   nb_portes: 5,
#   couleur: "NOIR",
#   boite_de_vitesse: "manuelle",
#   nb_rapports: 6,
#   garantie: "PREMIUM- 12",
#   categorie: "TOUT-TERRAIN"
# )
