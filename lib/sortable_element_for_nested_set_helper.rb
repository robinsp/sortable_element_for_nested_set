module SortableElementForNestedSetHelper
  
  class OptsGenerator
    attr_reader :element_id, :param_name
    
    def initialize(element_id, target_param_name)
      raise "Arg error" if element_id.blank? || target_param_name.blank?
      @element_id = element_id
      @param_name = target_param_name
    end
    
    def with_value
      "'#{@param_name}='+ $(#{@element_id.to_json}).moved_element.split('_').last() + '&' + Sortable.serialize(#{@element_id.to_json})"
    end
    
    def on_change_value 
      "function(e) { $('#{@element_id}').moved_element = e.id; }"
    end
    
    def opts
      {:with => with_value, :onChange => on_change_value}
    end
  end

  def sortable_element_reporting_target(element_id, target_param_name, options = {}) 
    javascript_tag(sortable_element_reporting_target_js(element_id, target_param_name, options) )
  end
  
  def sortable_element_reporting_target_js(element_id, target_param_name, options = {}) 
    raise "target_param_name is required" if target_param_name.blank?
    
    [:onChange, :with].each do |key|
      raise "#{key} is set by this helper and is not allowed" if options.has_key? key  
    end
    opts_gen = OptsGenerator.new(element_id, target_param_name)
    
    sortable_element_js(element_id, options.merge(opts_gen.opts))
  end
end

ActionView::Base.send(:include, SortableElementForNestedSetHelper)
