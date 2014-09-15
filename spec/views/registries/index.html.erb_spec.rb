require 'rails_helper'

RSpec.describe "registries/index", :type => :view do
  before(:each) do
    assign(:registries, [
      Registry.create!(),
      Registry.create!()
    ])
  end

  it "renders a list of registries" do
    render
  end
end
