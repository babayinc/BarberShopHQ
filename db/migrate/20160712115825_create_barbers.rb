class CreateBarbers < ActiveRecord::Migration
  def change
  	  	create_table :barbers do |t|
  			t.text :name

  			t.timestamps
  		end

  		Barber.create :name => 'Jesie Pinkman'
  		Barber.create :name => 'Gus Fring'
  		Barber.create :name => 'Walter White'
  end
end
