require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  def setup
    @event = Factory(:event)
  end
  
  context "on GET to :show" do
    setup { get :show, :id => @event}
    should_respond_with :success
    should_assign_to :event
  end
  
  context "on GET to :archive" do
    setup { get :archive}
    should_respond_with :success
    should_assign_to :events
  end
  
  context "on GET to :index" do
    context "with 'focus' param of 'attend'" do
      setup { get :index, :focus => 'attend'}
      should_assign_to :focus
    end
    
    context "with 'focus' param of 'speak'" do
      setup { get :index, :focus => 'speak'}
      should_assign_to :focus
    end
    
    context "with no 'focus' param'" do
      setup { get :index}
      should_assign_to :focus
    end
  end
end