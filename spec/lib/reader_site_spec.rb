require File.dirname(__FILE__) + "/../spec_helper"

describe 'Reader-extended site' do
  dataset :reader_sites
  dataset :reader_layouts
  Radiant::Config['readers.default_layout'] = 'Main'

  it "should have a layout association" do
    Site.reflect_on_association(:reader_layout).should_not be_nil
  end
    
  it "should default to the globally configured layout" do
    sites(:mysite).reader_layout_or_default.should == "Main"
  end
    
  it "should be able to set its own layout" do
    site = sites(:mysite)
    layout = Layout.new(:name => 'testing')
    layout.save
    site.reader_layout = layout
    site.reader_layout_or_default.should == layout.name
  end
end