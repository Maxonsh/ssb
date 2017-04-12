class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string    :name
      t.string    :address
      t.string    :email
      t.integer   :phone_number

      t.string    :crypted_password
      t.string    :password_salt

      t.string    :persistence_token
      t.index     :persistence_token, :unique => true

      t.string    :single_access_token
      t.index     :single_access_token, :unique => true

      t.string    :perishable_token
      t.index     :perishable_token, :unique => true

      t.integer   :login_count, :default => 0, :null => false
      t.integer   :failed_login_count, :default => 0, :null => false
      t.datetime  :last_request_at
      t.datetime  :current_login_at
      t.datetime  :last_login_at
      t.string    :current_login_ip
      t.string    :last_login_ip

      t.timestamps
    end
  end
end
