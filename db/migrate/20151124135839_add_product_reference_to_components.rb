class AddProductReferenceToComponents < ActiveRecord::Migration
  def change
  	add_column :components, :product_id, :integer, index: true
  end
end
