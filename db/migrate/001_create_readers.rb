class CreateReaders < ActiveRecord::Migration
  def self.up
    create_table :readers, :force => true do |t|
      t.column :name, :string, :limit => 100
      t.column :email, :string
      t.column :login, :string, :limit => 40, :default => "", :null => false
      t.column :password, :string, :limit => 40
      t.column :trusted, :boolean, :default => true
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
      t.column :created_by_id, :integer
      t.column :updated_by_id, :integer
      t.column :salt, :string
      t.column :session_token, :string
    end
    add_index :readers, ["login"], :name => "login", :unique => true
  end

  def self.down
    drop_table :readers
  end
end
