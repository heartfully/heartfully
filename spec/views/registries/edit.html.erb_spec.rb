require 'rails_helper'

RSpec.describe "registries/edit", :type => :view do
  before(:each) do
    @registry = assign(:registry, Registry.create!())
  end

  it "renders the edit registry form" do
    render

    assert_select "form[action=?][method=?]", registry_path(@registry), "post" do
    end
  end
end
