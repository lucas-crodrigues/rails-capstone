class GroupsEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :groups_entities, id: false do |t|
      t.belongs_to :group
      t.belongs_to :entity
    end
  end
end
