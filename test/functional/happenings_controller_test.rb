require 'test_helper'

class HappeningsControllerTest < ActionController::TestCase
  def setup
    @user  = Factory(:user)
    login_as @user
    @event     = Factory(:event, :twitter => @user.screen_name)
  end
  
  context "on GET to :index" do
    context "for an event with happening(s)" do
      setup do 
        @happening = Factory(:happening, :event => @event)
        get :index, :event_id => @event
      end

      should_respond_with :success
      should_assign_to :happenings
    end
    
    context "for an event with no happenings" do
      setup do
        @event.happenings.delete
        get :index, :event_id => @event
      end

      should_assign_to :happening
      should "setup a location for the happening" do
        assert_not_nil assigns(:happening).location
      end
    end
  end
  
  context "on GET to :new" do
    setup { get :new, :event_id => @event}
    
    should_respond_with :success
  end
  
  context "on GET to :edit" do
    setup do
      @happening = Factory(:happening, :event => @event)
      get :edit, :id => @happening
    end

    should_respond_with :success
    should_assign_to :happening
    should_assign_to :event
  end
  
  context "on PUT to :update" do
    setup do
      @happening = Factory(:happening, :event => @event)
      put :update, :happening => {}, :id => @happening, :event_id => @event
    end
    
    should_set_the_flash_to /Thanks/
    should_respond_with :redirect
    
    context "with invalid details" do
      setup do
        put :update, :happening => {:url => ''}, :id => @happening, :event_id => @event
      end

      should_respond_with :success
      should_render_template :edit
    end
  end
  
  context "on POST to :create" do
    setup do
      post :create, :happening => Factory.attributes_for(:happening), :event_id => @event
    end
    
    should_set_the_flash_to /Thanks/
    should_respond_with :redirect
  end
  
end
