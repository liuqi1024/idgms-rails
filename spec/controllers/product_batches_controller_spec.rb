require 'spec_helper'

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

describe ProductBatchesController do

  # This should return the minimal set of attributes required to create a valid
  # ProductBatch. As you add validations to ProductBatch, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "worksheet" => "" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProductBatchesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all product_batches as @product_batches" do
      product_batch = ProductBatch.create! valid_attributes
      get :index, {}, valid_session
      assigns(:product_batches).should eq([product_batch])
    end
  end

  describe "GET show" do
    it "assigns the requested product_batch as @product_batch" do
      product_batch = ProductBatch.create! valid_attributes
      get :show, {:id => product_batch.to_param}, valid_session
      assigns(:product_batch).should eq(product_batch)
    end
  end

  describe "GET new" do
    it "assigns a new product_batch as @product_batch" do
      get :new, {}, valid_session
      assigns(:product_batch).should be_a_new(ProductBatch)
    end
  end

  describe "GET edit" do
    it "assigns the requested product_batch as @product_batch" do
      product_batch = ProductBatch.create! valid_attributes
      get :edit, {:id => product_batch.to_param}, valid_session
      assigns(:product_batch).should eq(product_batch)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ProductBatch" do
        expect {
          post :create, {:product_batch => valid_attributes}, valid_session
        }.to change(ProductBatch, :count).by(1)
      end

      it "assigns a newly created product_batch as @product_batch" do
        post :create, {:product_batch => valid_attributes}, valid_session
        assigns(:product_batch).should be_a(ProductBatch)
        assigns(:product_batch).should be_persisted
      end

      it "redirects to the created product_batch" do
        post :create, {:product_batch => valid_attributes}, valid_session
        response.should redirect_to(ProductBatch.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved product_batch as @product_batch" do
        # Trigger the behavior that occurs when invalid params are submitted
        ProductBatch.any_instance.stub(:save).and_return(false)
        post :create, {:product_batch => { "worksheet" => "invalid value" }}, valid_session
        assigns(:product_batch).should be_a_new(ProductBatch)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ProductBatch.any_instance.stub(:save).and_return(false)
        post :create, {:product_batch => { "worksheet" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested product_batch" do
        product_batch = ProductBatch.create! valid_attributes
        # Assuming there are no other product_batches in the database, this
        # specifies that the ProductBatch created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ProductBatch.any_instance.should_receive(:update_attributes).with({ "worksheet" => "" })
        put :update, {:id => product_batch.to_param, :product_batch => { "worksheet" => "" }}, valid_session
      end

      it "assigns the requested product_batch as @product_batch" do
        product_batch = ProductBatch.create! valid_attributes
        put :update, {:id => product_batch.to_param, :product_batch => valid_attributes}, valid_session
        assigns(:product_batch).should eq(product_batch)
      end

      it "redirects to the product_batch" do
        product_batch = ProductBatch.create! valid_attributes
        put :update, {:id => product_batch.to_param, :product_batch => valid_attributes}, valid_session
        response.should redirect_to(product_batch)
      end
    end

    describe "with invalid params" do
      it "assigns the product_batch as @product_batch" do
        product_batch = ProductBatch.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ProductBatch.any_instance.stub(:save).and_return(false)
        put :update, {:id => product_batch.to_param, :product_batch => { "worksheet" => "invalid value" }}, valid_session
        assigns(:product_batch).should eq(product_batch)
      end

      it "re-renders the 'edit' template" do
        product_batch = ProductBatch.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ProductBatch.any_instance.stub(:save).and_return(false)
        put :update, {:id => product_batch.to_param, :product_batch => { "worksheet" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested product_batch" do
      product_batch = ProductBatch.create! valid_attributes
      expect {
        delete :destroy, {:id => product_batch.to_param}, valid_session
      }.to change(ProductBatch, :count).by(-1)
    end

    it "redirects to the product_batches list" do
      product_batch = ProductBatch.create! valid_attributes
      delete :destroy, {:id => product_batch.to_param}, valid_session
      response.should redirect_to(product_batches_url)
    end
  end

end
