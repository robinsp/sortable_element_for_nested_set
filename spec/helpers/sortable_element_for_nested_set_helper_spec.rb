require File.dirname(__FILE__) + '/../spec_helper'

describe SortableElementForNestedSetHelper do 
  
  # Shorten the class name a bit for the specs
  OptsGenerator = SortableElementForNestedSetHelper::OptsGenerator 
  
  describe "sortable_element_reporting_target OptsGenerator" do 
    before do 
      @element_id = "el_name"
      @param_name = "param_name"
      @generator = OptsGenerator.new(@element_id, @param_name)
    end
    
    it "should require two non-blank init args" do 
      lambda {OptsGenerator.new()}.should raise_error
      lambda {OptsGenerator.new("", "val")}.should raise_error
      lambda {OptsGenerator.new("val", "")}.should raise_error
      lambda {OptsGenerator.new("val", "val")}.should_not raise_error
    end
    
    it "should create hash of options" do 
      @generator.opts.should == {:with => @generator.with_value, :onChange => @generator.on_change_value }
    end
    
    it "should create javascript for 'onChange' attribute" do 
      @generator.on_change_value.should ==
        "function(e) { $('#{@element_id}').moved_element = e.id; }"
    end
    
    it "should create javascript for 'with' attribute" do 
      @generator.with_value.should == 
      "'#{@param_name}='+ $(#{@element_id.to_json}).moved_element.split('_').last() + '&' + Sortable.serialize(#{@element_id.to_json})"
    end
    
  end
  
  describe "sortable_element_reporting_target" do 
    it "should forward args to sortable_element_reporting_target_js " do 
      helper.expects(:sortable_element_reporting_target_js).with("arg1", "arg2", "arg3")
      helper.sortable_element_reporting_target("arg1", "arg2", "arg3")
    end
    
    it "should wrap the javascript with the javascript_tag helper" do 
      helper.stubs(:sortable_element_reporting_target_js).returns("raw_javascript")
      helper.expects(:javascript_tag).with("raw_javascript").returns("result")
      
      helper.sortable_element_reporting_target("arg1", "arg1").should == "result"
    end
    
  end
  
  describe "sortable_element_reporting_target_js" do 
    
    before do 
      @opts_generator = mock("OptsGenerator") do 
        stubs(:opts).returns({:hash => "of", :generated => "options"})
      end
      
      OptsGenerator.stubs(:new).returns(@opts_generator)
      helper.stubs(:sortable_element_js).returns("result")
    end
    
    describe "argument validation" do 
      after do 
        @illegal_call.should raise_error
      end
      
      it "should not allow the 'onChange' attribute" do 
        @illegal_call = lambda do 
          helper.sortable_element_reporting_target_js("element_id", "targetparam", :onChange => "causes failure" ) 
        end
      end
      
      it "should not allow the 'with' attribute" do 
        @illegal_call = lambda do 
          helper.sortable_element_reporting_target_js("element_id", "targetparam", :with => "causes failure" ) 
        end
      end
      
      it "should require the target_param_name parameter" do 
        @illegal_call = lambda do 
          helper.sortable_element_reporting_target_js("element_id", "") 
        end
      end
    end
    
    it "should not require an options hash" do 
      legal_call = lambda do 
        helper.sortable_element_reporting_target_js("element_id", "targetparam") 
      end
      legal_call.should_not raise_error 
    end
    
    it "should use sortable_element_js helper" do 
      helper.expects(:sortable_element_js).with("element_id", @opts_generator.opts ).returns("result")
      helper.sortable_element_reporting_target_js("element_id", "targetparam").should == "result"
    end
    
    it "should merge generated options into the options hash passed to sortable_element" do
      opts_from_view = {:options => "from view"}
      expected_opts = opts_from_view.merge(@opts_generator.opts)
      
      helper.expects(:sortable_element_js).with("element_id", expected_opts )
                                             
      helper.sortable_element_reporting_target_js("element_id", "targetparam", opts_from_view)
    end
    
    it "should create OptsGenerator using element_id and target_param arguments" do 
      OptsGenerator.expects(:new).with("my_element_id", "my_target_param").returns(@opts_generator)
      helper.sortable_element_reporting_target_js("my_element_id", "my_target_param")
    end
  end
end
