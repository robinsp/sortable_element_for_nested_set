require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SortableElementForNestedSet::TreeMoveCalculator do
  before do 
    @class_under_test = SortableElementForNestedSet::TreeMoveCalculator
    
    @sort_order = 
      {  
        "0" => {"id" => "100",
                "0" => {"id" => "200"},
                "1" => {"id" => "300", 
                        "1" => {"id" => "500"},
                        "0" => {"id" => "600"}
                       },
                "2" => {"id" => "400"}
               },
        "1" => {"id" => "700" }
      }
      
    @calculator = @class_under_test.new(@sort_order)
  end
  
  it "should return placement details in a hash" do 
    target_id = 1
    @calculator.expects(:parent_of).with(target_id).returns(11)
    @calculator.expects(:left_of).with(target_id).returns(12)
    @calculator.expects(:right_of).with(target_id).returns(13)
    
    @calculator.placement_of(target_id).should == {:parent => 11, 
            :move_to_right_of => 12, :move_to_left_of => 13}
  end
  
  it "should find right_of" do 
    @calculator.right_of(100).should == 700
    @calculator.right_of(200).should == 300
    @calculator.right_of(300).should == 400
    @calculator.right_of(400).should be_nil
    @calculator.right_of(500).should be_nil
    @calculator.right_of(600).should == 500
    @calculator.right_of(700).should be_nil
  end
  
  it "should find left_of" do 
    @calculator.left_of(100).should be_nil
    @calculator.left_of(200).should be_nil
    @calculator.left_of(300).should == 200
    @calculator.left_of(400).should == 300
    @calculator.left_of(500).should == 600
    @calculator.left_of(600).should be_nil
    @calculator.left_of(700).should == 100
  end
  
  it "should find parent" do 
    @calculator.parent_of(100).should be_nil 
    @calculator.parent_of(700).should be_nil
    
    @calculator.parent_of(200).should == 100
    @calculator.parent_of(300).should == 100
    @calculator.parent_of(400).should == 100
    
    @calculator.parent_of(500).should == 300
    @calculator.parent_of(600).should == 300
  end
  
  it "create tree nodes with parents" do 
    result = @class_under_test.create_tree_nodes(@sort_order)
    result.size.should == 2
    
    result.first.id.should == 100
    result.first.children.collect {|x| [x.parent_id, x.id] }.should == [ [100,200], [100, 300], [100,400] ]
    result.first.children.second.children.collect {|x| [x.parent_id, x.id] }.should == [[300,600], [300,500] ]
    
    result.last.id.should == 700
  end
  
  describe "to_hash()" do 
    it "should return empty hash if array is empty" do 
        @class_under_test.to_hash([]).should == {}
    end
    
    it "should convert flat array to hash" do 
      array = ["3", "2", "1"]
      expected_hash = { "0" => {"id" => "3"}, 
                        "1" => {"id" => "2"}, 
                        "2" => {"id" => "1"} 
                      }
      
      @class_under_test.to_hash(array).should == expected_hash
    end
  end
end