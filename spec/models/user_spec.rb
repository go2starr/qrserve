require 'spec_helper'

describe User do

  before :each do
    @attr = {
      :name => "Example user",
      :email => "go2starr@example.com",
      :password => "password",
      :password_confirmation => "password",
    }
  end

  it "should create a new instance given valid attributes" do
    User.create! @attr
  end
  
  describe "names" do
    it "should require a name" do
      no_name_user = User.new @attr.merge :name => ""
      no_name_user.should_not be_valid
    end

    it "should not be too long" do
      long_name_user = User.new @attr.merge :name => 'a'*51
      long_name_user.should_not be_valid
    end
  end
  
  describe "email" do
    it "should require an email" do
      no_email_user = User.new @attr.merge :email => ""
      no_email_user.should_not be_valid
    end

    it "should accept valid email addresses" do
      addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
      addresses.each do |address|
        valid_email_user = User.new @attr.merge :email => address
        valid_email_user.should be_valid
      end
    end

    it "should reject invalid email addresses" do
      addresses = %w[@foo.com THE_USER@ @ . foo.com foo@the example.user@foo.]
      addresses.each do |address|
        invalid_email_user = User.new @attr.merge :email => address
        invalid_email_user.should_not be_valid
      end
    end

    it "should reject duplicate emails up to case" do
      User.create! @attr.merge :email => @attr[:email].upcase
      duplicate_email_user = User.new @attr
      duplicate_email_user.should_not be_valid
    end      
  end

  describe "password validations" do
    it "should require a password" do
      user = User.new @attr.merge :password => "", :password_confirmation => ""
      user.should_not be_valid
    end

    it "should require matching password and password_confirmation" do
      user = User.new @attr.merge :password => "invalid", :password_confirmation => "combination"
      user.should_not be_valid
    end

    it "should reject short passwords" do
      user = User.new @attr.merge :password => "123", :password_confirmation => "123"
      user.should_not be_valid
    end

    it "should reject long passwords" do
      user = User.new @attr.merge :password => 'a' * 50, :password_confirmation => 'a' * 50
      user.should_not be_valid
    end

    describe "password encryption" do
      before :each do
        @user = User.create! @attr
      end
      
      it "should have an encrypted password attribute" do
        @user.should respond_to :encrypted_password
      end

      it "should set an encrypted password" do
        @user.encrypted_password.should_not be_blank
      end
      
      describe "has_password? method" do
        it "should be true if the passwords match" do
          @user.has_password?(@attr[:password]).should be_true
        end

        it "should be false if the passwords don't match" do
          @user.has_password?("invalid").should be_false
        end
      end

      describe "authenticate method" do
        it "should return nil on email/password mismatch" do
          wrong_password_user = User.authenticate @attr[:email], "wrongpass"
          wrong_password_user.should be_nil
        end

        it "should return nil for an email address with no user" do
          no_email_user = User.authenticate "", "pass"
          no_email_user.should be_nil
        end

        it "should return the user on email/password match" do
          user = User.authenticate @attr[:email], @attr[:password]
          user.should == @user
        end
      end
    end
  end
end


# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#  cart_id            :integer
#

