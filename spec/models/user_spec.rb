require 'spec_helper'

describe User do
    it "should have no failed logins on creation" do
        user = FactoryGirl.create(:user)
        expect(user.failed_logins).to eq(0)
    end

    it "should increment the failed logins" do
        user = FactoryGirl.create(:user)
        user.increment_failed_logins()
        expect(user.failed_logins).to eq(1)
    end

    it "should reset the failed logins" do
        user = FactoryGirl.create(:user, failed_logins: 2)
        user.successfull_login()
        expect(user.failed_logins).to eq(0)
    end

    it "should save the last login date" do
        user = FactoryGirl.create(:user)
        user.successfull_login()
        expect(user.lastlogin).to_not be(nil)
    end
    
    it "should not allow to users with the same username" do
        user = FactoryGirl.create(:user, :username => "testuser")
        user2 = FactoryGirl.build(:user, :username => "testuser")
        expect(user2.save).to be(false)
    end

    it "should not allow duplicate email addresses" do
        user = FactoryGirl.create(:user, :email => "test@test.com")
        user2 = FactoryGirl.build(:user, :email => "test@test.com")
        expect(user2.save).to be(false)
    end
end
