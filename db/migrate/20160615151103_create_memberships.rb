class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :group, null: false
      t.references :user, null: false
      t.string :role, null: false

      t.timestamps null: false
    end
  end
end
