class SerializableProduct < JSONAPI::Serializable::Resource
  	type :product
	attributes :id, :name, :price, :user_id
	belongs_to :user
end