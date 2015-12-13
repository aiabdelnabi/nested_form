module ApplicationHelper

	def link_to_add_fields(name, f, assocation)
		new_object = f.object.send(assocation).klass.new
		id = new_object.object_id
		fields = f.fields_for(assocation, new_object, child_index: id) do |builder|
			render assocation.to_s.singularize + "_fields", f: builder
		end
		link_to name, "#", class: "add-fields btn btn-success", data: {id: id, fields: fields.gsub("\n", "")}
	end
end
