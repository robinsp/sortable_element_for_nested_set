require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class SortableElementForNestedSet::SortingController < ActionController::Base
  handles_sorting_of_nested_set
  
  def move
    # This action is defined to let the specs set up the state of the controller easily
    render :nothing => true
  end
end

describe SortableElementForNestedSet::SortingController do
  before do 
    @moved_id = "1234"
    @tree = ["sort", "order", "array"]
    
    xhr :post, :move, :moved_element_id => @moved_id, :tree_param => @tree
  end
    
  describe "position_of" do 
    it "should save the value of the given param in instance variable" do 
      @controller.instance_eval  { position_of(:moved_element_id) }
      @controller.dragged_record_id.should == @moved_id.to_i
    end
    
    it "should return the controller instance" do 
      result = @controller.instance_eval { position_of(:moved_element_id) }
      result.should == @controller
    end
  end
  
  describe "in_tree" do 
    before do 
      @calculator_class = SortableElementForNestedSet::TreeMoveCalculator
    
      @placement_hash = {:new => "placement"}
        
      @calc_mock = mock
      
      @calc_mock.stubs(:placement_of).returns(@placement_hash)
      @calculator_class.stubs(:new).returns(@calc_mock)
    end
    
    it "should create TreeMoveCalculator" do
      @calculator_class.expects(:new).with(@tree).returns(@calc_mock)
      @controller.instance_eval{ in_tree(:tree_param) }
    end
    
    it "should ask TreeMoveCalculator for the new placement" do
      @controller.expects(:dragged_record_id).returns(321)
      @calc_mock.expects(:placement_of).with(321)
      
      @controller.instance_eval{ in_tree(:tree_param) }
    end
    
    it "should return hash with the position of the moved item" do 
      result = @controller.instance_eval{ in_tree(:tree_param) }
      result.should == @placement_hash
    end
  end
end