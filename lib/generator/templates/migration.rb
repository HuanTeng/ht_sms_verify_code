class CreateSmsVerifyCode < ActiveRecord::Migration

    def self.up
        create_table :sms_verify_code do |t|
            t.string :phone, :limit => 20
            t.string :code, :limit => 20
            t.string :message
            t.boolean :used
            t.integer :duration

            t.timestamps
        end

        add_index :sms_verify_code, :phone, :name => "idx_phone"
        add_index :sms_verify_code, :code, :name => "idx_code"
    end

    def self.down
        drop_table :sms_verify_code
    end

end
