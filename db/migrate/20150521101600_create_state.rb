require_relative '../config'

class CreateState < ActiveRecord::Migration

  def change
    create_table :states do |state|
      state.string :name
    end
  end

end


