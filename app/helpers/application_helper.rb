module ApplicationHelper
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)", :class =>"btn danger small", :style => "margin-top: 20px;")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    
    link_to_function(name, "add_fields(this, '#{association}', '#{escape_javascript(fields)}')", :class => "btn primary small")
  end
  
  def audio_tag(enclosure)
  	audio_tag = tag("audio", {:controls => true}, true)
  	
  	audio_tag << tag("source", {:src => enclosure.url})
  	
  	enclosure.alternative_enclosures.each do |format|
  		audio_tag << tag("source", {:src => format.url})
  	end
  	
  	audio_tag << tag("audio")
  	audio_tag
  end
end
