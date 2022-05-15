class CreateInitialCategories < ActiveRecord::Migration[7.0]
   def up
    Category.create(name: "Biscoitos e Snacks")
    Category.create(name: "Bomboniere")
    Category.create(name: "Hortifrutis")
    Category.create(name: "Laticínios")
    Category.create(name: "Embalagens")
    Category.create(name: "Churrascaria")
    Category.create(name: "Congelados")
    Category.create(name: "Latarias e conservas")
    Category.create(name: "Adega")
    Category.create(name: "Padaria")
    Category.create(name: "Açougue")
    Category.create(name: "Condimentos")
    Category.create(name: "Molhos")
    Category.create(name: "Cereais")
    Category.create(name: "Massas")
    Category.create(name: "Bebidas")
    Category.create(name: "Limpeza e Higiene")
    Category.create(name: "Perfumaria")
  end

  def down
    Category.delete_all
  end
end
