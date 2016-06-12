require 'rails_helper'

RSpec.describe "permissions/new", type: :view do
  before(:each) do
    assign(:permission, Permission.new(
      :create => false,
      :read => false,
      :update => false,
      :delete => false,
      :print => false,
      :modulo => nil,
      :functionality => nil
    ))
  end

  it "renders new permission form" do
    render

    assert_select "form[action=?][method=?]", permissions_path, "post" do

      assert_select "input#permission_create[name=?]", "permission[create]"

      assert_select "input#permission_read[name=?]", "permission[read]"

      assert_select "input#permission_update[name=?]", "permission[update]"

      assert_select "input#permission_delete[name=?]", "permission[delete]"

      assert_select "input#permission_print[name=?]", "permission[print]"

      assert_select "input#permission_modulo_id[name=?]", "permission[modulo_id]"

      assert_select "input#permission_functionality_id[name=?]", "permission[functionality_id]"
    end
  end
end
