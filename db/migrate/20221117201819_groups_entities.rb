class GroupsEntities < ActiveRecord::Migration[7.0]
  def change
    create_join_table :groups, :entities do |t|
      t.index :group_id
      t.index :entity_id
    end
  end
end
