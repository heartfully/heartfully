require 'rails_helper'

RSpec.describe "registries/show", :type => :view do
  before(:each) do
    @registry = assign(:registry, Registry.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
