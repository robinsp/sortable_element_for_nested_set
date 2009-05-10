require 'sortable_element_for_nested_set_helper'

ActionView::Base.send(:include, SortableElementForNestedSetHelper)
ActionController::Base.send( :include, SortableElementForNestedSet)