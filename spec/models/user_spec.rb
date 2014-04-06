require 'spec_helper'

describe User do

  describe "attributes" do

    let(:user) { build(:user) }

    it "has name" do
      expect(user).to respond_to(:name)
    end

    it "has email" do
      expect(user).to respond_to(:email)
    end

    it "has password_digest" do
      expect(user).to respond_to(:password_digest)
    end

    it "has password" do
      expect(user).to respond_to(:password)
    end

    it "has password_confirmation" do
      expect(user).to respond_to(:password_confirmation)
    end

    it "has remember_token" do
      expect(user).to respond_to(:remember_token)
    end

    it "has authenticate" do
      expect(user).to respond_to(:authenticate)
    end
  end
end
