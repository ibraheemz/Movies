class RemovePosterFileNameFromMovies < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :poster_file_name, :string
  end
end
