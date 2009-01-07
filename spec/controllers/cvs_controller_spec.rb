require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CvsController do

  def mock_cv(stubs={})
    @mock_cv ||= mock_model(Cv, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all cvs as @cvs" do
      Cv.should_receive(:find).with(:all).and_return([mock_cv])
      get :index
      assigns[:cvs].should == [mock_cv]
    end

    describe "with mime type of xml" do
  
      it "should render all cvs as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Cv.should_receive(:find).with(:all).and_return(cvs = mock("Array of Cvs"))
        cvs.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested cv as @cv" do
      Cv.should_receive(:find).with("37").and_return(mock_cv)
      get :show, :id => "37"
      assigns[:cv].should equal(mock_cv)
    end
    
    describe "with mime type of xml" do

      it "should render the requested cv as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Cv.should_receive(:find).with("37").and_return(mock_cv)
        mock_cv.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new cv as @cv" do
      Cv.should_receive(:new).and_return(mock_cv)
      get :new
      assigns[:cv].should equal(mock_cv)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested cv as @cv" do
      Cv.should_receive(:find).with("37").and_return(mock_cv)
      get :edit, :id => "37"
      assigns[:cv].should equal(mock_cv)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created cv as @cv" do
        Cv.should_receive(:new).with({'these' => 'params'}).and_return(mock_cv(:save => true))
        post :create, :cv => {:these => 'params'}
        assigns(:cv).should equal(mock_cv)
      end

      it "should redirect to the created cv" do
        Cv.stub!(:new).and_return(mock_cv(:save => true))
        post :create, :cv => {}
        response.should redirect_to(cv_url(mock_cv))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved cv as @cv" do
        Cv.stub!(:new).with({'these' => 'params'}).and_return(mock_cv(:save => false))
        post :create, :cv => {:these => 'params'}
        assigns(:cv).should equal(mock_cv)
      end

      it "should re-render the 'new' template" do
        Cv.stub!(:new).and_return(mock_cv(:save => false))
        post :create, :cv => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested cv" do
        Cv.should_receive(:find).with("37").and_return(mock_cv)
        mock_cv.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :cv => {:these => 'params'}
      end

      it "should expose the requested cv as @cv" do
        Cv.stub!(:find).and_return(mock_cv(:update_attributes => true))
        put :update, :id => "1"
        assigns(:cv).should equal(mock_cv)
      end

      it "should redirect to the cv" do
        Cv.stub!(:find).and_return(mock_cv(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(cv_url(mock_cv))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested cv" do
        Cv.should_receive(:find).with("37").and_return(mock_cv)
        mock_cv.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :cv => {:these => 'params'}
      end

      it "should expose the cv as @cv" do
        Cv.stub!(:find).and_return(mock_cv(:update_attributes => false))
        put :update, :id => "1"
        assigns(:cv).should equal(mock_cv)
      end

      it "should re-render the 'edit' template" do
        Cv.stub!(:find).and_return(mock_cv(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested cv" do
      Cv.should_receive(:find).with("37").and_return(mock_cv)
      mock_cv.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the cvs list" do
      Cv.stub!(:find).and_return(mock_cv(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(cvs_url)
    end

  end

end
