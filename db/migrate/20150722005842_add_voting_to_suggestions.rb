class AddVotingToSuggestions < ActiveRecord::Migration
  def change
    add_column :suggestions, :voting, :boolean, default: true
  end
end
