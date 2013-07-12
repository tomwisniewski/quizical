require 'spec_helper'

describe UsersController do

  describe "GET 'show'" do
    it "returns http success" do
      user = User.create(:username => 'tommy', :email => 'tommy@gmail.cm', :password => 'password', :password_confirmation => 'password')
      get 'show', :id => user.id
      response.should be_success
    end
  end

  describe "DELETE 'destroy'" do
    it "deletes the user" do
      user = User.create(:username => 'tommy', :email => 'tommy@gmail.cm', :password => 'password', :password_confirmation => 'password')
      expect(User.all.count).to eql 1
      delete 'destroy', :id => user.id
      expect(User.all.count).to eql 0
    end
  end

  describe "POST 'create'" do
    it "creates the user" do
      expect(User.all.count).to eql 0
      post 'create',:user => {:username => 'tommy', :email => 'tommy@gmail.cm', :password => 'password', :password_confirmation => 'password'}
      expect(User.all.count).to eql 1
    end
  end

  describe "POST 'update'" do
    it "creates the user" do
      user = User.create(:username => 'tommy', :email => 'tommy@gmail.cm', :password => 'password', :password_confirmation => 'password')
      expect(User.all.count).to eql 1
      patch 'update', :id => user.id, :user => {:username => 'Neil', :email => 'tommy@gmail.cm'}
      updated_user = User.find(user.id)
      expect(updated_user.username).to eql "Neil"
      expect(User.all.count).to eql 1
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      user = User.create(:username => 'tommy', :email => 'tommy@gmail.cm', :password => 'password', :password_confirmation => 'password')
      get 'edit', id: user.id
      response.should be_success
    end
  end

end
