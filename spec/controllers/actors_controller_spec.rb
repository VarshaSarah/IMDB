require 'spec_helper'

describe ActorsController do
	context "GET index" do		#verb
		it "lists all the actors" do
      get :index
      expect(response).to render_template("index")
    end

	end

	context "GET show" do
    let(:actor) {FactoryGirl.create(:actor)}
    it "show details of an actor" do
     get :show , {:id=>actor.id}
     expect(response).to render_template("show")
    end
  end

	context "GET new" do
    let(:new_actor) {FactoryGirl.create(:actor)}
    it "display the new form of an actor" do
      get :edit, {id: new_actor.id}
      expect(response).to render_template("edit")
    end

  end

	context "POST create" do

    context "SUCCESFULL-create" do
      let(:new_actor) {FactoryGirl.attributes_for(:actor)}
      it "Creates a new actor" do
        post :create, {actor: new_actor}  # post :create, {FactoryGirl.attributes_for(:actor)}
        expect(response).to redirect_to(actors_path)
      end
    end

    context"FAILED-create" do
      let(:new_actor) {FactoryGirl.attributes_for(:actor , name:"")}
      it "fails to create " do
        post :create, {actor: new_actor}
        expect(response).to render_template("new")
      end
    end


  end
	
	context "GET edit" do

    let(:new_actor) {FactoryGirl.create(:actor)}
    it "fetches specified actor in an editable form" do
      get :edit, {id: new_actor.id}
      expect(response).to render_template("edit")
    end

	end


	context "PUT update" do

    context "Successsful-update" do
      let(:new_actor) {FactoryGirl.create(:actor)}
      it"updates details of specified actors" do
        put :update, {id: new_actor.id, actor:{name: "Varsha"}}
        expect(response).to redirect_to(actors_path)
      end
    end

    context "Failed-update" do
      let(:new_actor) {FactoryGirl.create(:actor)}
      it"fails to update details of specified actors" do
        patch :update, {id: new_actor.id , actor:{name: ""}}
        expect(response).to render_template("new")
      end

    end
  end
	
	context "DELETE delete" do
	  context "SUCCESFULL-delete" do
       let(:new_actor) {FactoryGirl.create(:actor)}
       it "deletes a new actor" do
         delete :destroy, {id: new_actor.id}  # post :create, {FactoryGirl.attributes_for(:actor)}
         expect(response).to redirect_to(actors_path)
       end
    end
    context"FAILED-delete" do
      let(:new_actor) {FactoryGirl.create(:actor)}
        it "fails to delete" do
          delete :destroy, {id: 800}
          expect(response).to raise_exception
        end
    end

  end


end
