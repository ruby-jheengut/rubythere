Given /^I have an event called "([^\"]*)"$/ do |name|
  @event = Factory(:event, :name => name, :twitter => @user.screen_name)
  Factory(:happening, :event => @event)
end

When /^I view the event page for (.*)/ do |name|
  visit path_to("the event page for #{name}")
end

Given /^twitter has some search results for "([^\"]*)"$/ do |name|
  stub_get("http://search.twitter.com/search.json?q=#{CGI.escape(name)}", 'search.json')
end

Given /^there is an event called "([^\"]*)"$/ do |name|
  event = Factory(:event, :name => name)
  Factory(:happening, :event => event)
end