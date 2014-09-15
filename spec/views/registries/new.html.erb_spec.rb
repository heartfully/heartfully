require 'rails_helper'

RSpec.describe "registries/new", :type => :view do
  before(:each) do
    assign(:registry, Registry.new())
  end

  it "renders new registry form" do
    render

    assert_select "form[action=?][method=?]", registries_path, "post" do
    end
  end
end
