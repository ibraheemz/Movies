class AddPosterToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :poster_file_name, :string, default: "placeholder.png"
  end
end
