class SerializableUser < JSONAPI::Serializable::Resource
  	type :user
	attributes :id, :name, :document
	has_many :products do
		data do
	      @object.products
	    end

		meta do
		  { count: @object.products.count }
		end
	end
end