require 'spec_helper'

describe MoviesController do
  context "GET index" do		#verb
    it "lists all the movies" do
      get :index
      expect(response).to render_template("index")
    end

  end

  context "GET show" do
    let(:movie) {FactoryGirl.create(:movie)}
    it "show details of an movie" do
      get :show , {:id=>movie.id}
      expect(response).to render_template("show")
    end
  end

  context "GET new" do
    let(:new_movie) {FactoryGirl.create(:movie)}
    it "display the new form of an movie" do
      get :edit, {id: new_movie.id}
      expect(response).to render_template("edit")
    end

  end

  context "POST create" do

    context "SUCCESFULL-create" do
      let(:new_movie) {FactoryGirl.attributes_for(:movie)}
      it "Creates a new movie" do
        post :create, {movie: new_movie}  # post :create, {FactoryGirl.attributes_for(:actor)}
        expect(response).to redirect_to(movies_path)
      end
    end

    context"FAILED-create" do
      let(:new_movie) {FactoryGirl.attributes_for(:movie , name:"")}
      it "fails to create " do
        post :create, {movie: new_movie}
        expect(response).to render_template("new")
      end
    end


  end

  context "GET edit" do

    let(:new_movie) {FactoryGirl.create(:movie)}
    it "fetches specified movie in an editable form" do
      get :edit, {id: new_movie.id}
      expect(response).to render_template("edit")
    end

  end


  context "PUT update" do

    context "Successsful-update" do
      let(:new_movie) {FactoryGirl.create(:movie)}
      it"updates details of specified movies" do
        put :update, {id: new_movie.id, movie:{name: "Varsha"}}
        expect(response).to redirect_to(movies_path)
      end
    end

    context "Failed-update" do
      let(:new_movie) {FactoryGirl.create(:movie)}
      it"fails to update details of specified movies" do
        patch :update, {id: new_movie.id , movie:{name: ""}}
        expect(response).to render_template("new")
      end

    end
  end

  context "DELETE delete" do
    context "SUCCESFULL-delete" do
      let(:new_movie) {FactoryGirl.create(:movie)}
      it "deletes a new movie" do
        delete :destroy, {id: new_movie.id}  # post :create, {FactoryGirl.attributes_for(:movie)}
        expect(response).to redirect_to(movies_path)
      end
    end
    context"FAILED-delete" do
      let(:new_movie) {FactoryGirl.create(:movie)}
      it "fails to delete" do
        delete :destroy, {id: 800}
        expect(response).to raise_exception
      end
    end

  end


end
