require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CvsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "cvs", :action => "index").should == "/cvs"
    end
  
    it "should map #new" do
      route_for(:controller => "cvs", :action => "new").should == "/cvs/new"
    end
  
    it "should map #show" do
      route_for(:controller => "cvs", :action => "show", :id => 1).should == "/cvs/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "cvs", :action => "edit", :id => 1).should == "/cvs/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "cvs", :action => "update", :id => 1).should == "/cvs/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "cvs", :action => "destroy", :id => 1).should == "/cvs/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/cvs").should == {:controller => "cvs", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/cvs/new").should == {:controller => "cvs", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/cvs").should == {:controller => "cvs", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/cvs/1").should == {:controller => "cvs", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/cvs/1/edit").should == {:controller => "cvs", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/cvs/1").should == {:controller => "cvs", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/cvs/1").should == {:controller => "cvs", :action => "destroy", :id => "1"}
    end
  end
end
