class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body

      t.timestamps
      # cria duas colunas: created_at e updated_at
    end
  end
end
