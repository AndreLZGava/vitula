require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe ClosesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Close. As you add validations to Close, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ClosesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all closes as @closes" do
      close = Close.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:closes)).to eq([close])
    end
  end

  describe "GET #show" do
    it "assigns the requested close as @close" do
      close = Close.create! valid_attributes
      get :show, {:id => close.to_param}, valid_session
      expect(assigns(:close)).to eq(close)
    end
  end

  describe "GET #new" do
    it "assigns a new close as @close" do
      get :new, {}, valid_session
      expect(assigns(:close)).to be_a_new(Close)
    end
  end

  describe "GET #edit" do
    it "assigns the requested close as @close" do
      close = Close.create! valid_attributes
      get :edit, {:id => close.to_param}, valid_session
      expect(assigns(:close)).to eq(close)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Close" do
        expect {
          post :create, {:close => valid_attributes}, valid_session
        }.to change(Close, :count).by(1)
      end

      it "assigns a newly created close as @close" do
        post :create, {:close => valid_attributes}, valid_session
        expect(assigns(:close)).to be_a(Close)
        expect(assigns(:close)).to be_persisted
      end

      it "redirects to the created close" do
        post :create, {:close => valid_attributes}, valid_session
        expect(response).to redirect_to(Close.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved close as @close" do
        post :create, {:close => invalid_attributes}, valid_session
        expect(assigns(:close)).to be_a_new(Close)
      end

      it "re-renders the 'new' template" do
        post :create, {:close => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested close" do
        close = Close.create! valid_attributes
        put :update, {:id => close.to_param, :close => new_attributes}, valid_session
        close.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested close as @close" do
        close = Close.create! valid_attributes
        put :update, {:id => close.to_param, :close => valid_attributes}, valid_session
        expect(assigns(:close)).to eq(close)
      end

      it "redirects to the close" do
        close = Close.create! valid_attributes
        put :update, {:id => close.to_param, :close => valid_attributes}, valid_session
        expect(response).to redirect_to(close)
      end
    end

    context "with invalid params" do
      it "assigns the close as @close" do
        close = Close.create! valid_attributes
        put :update, {:id => close.to_param, :close => invalid_attributes}, valid_session
        expect(assigns(:close)).to eq(close)
      end

      it "re-renders the 'edit' template" do
        close = Close.create! valid_attributes
        put :update, {:id => close.to_param, :close => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested close" do
      close = Close.create! valid_attributes
      expect {
        delete :destroy, {:id => close.to_param}, valid_session
      }.to change(Close, :count).by(-1)
    end

    it "redirects to the closes list" do
      close = Close.create! valid_attributes
      delete :destroy, {:id => close.to_param}, valid_session
      expect(response).to redirect_to(closes_url)
    end
  end

end
