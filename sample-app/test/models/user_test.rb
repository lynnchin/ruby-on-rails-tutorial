require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example user", email: "user@example.com", password: "foobar123")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "      "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "password should contains minimum 6 characters" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = "a" * 6
    assert @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 250 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email address should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email address always change to downcase" do
    upcase_email_address = 'LALA@MAIL.COM'
    @user.email = upcase_email_address
    @user.save
    assert @user.email, upcase_email_address.downcase 
  end

  test "user is invalid with valid name and email but a too-short password" do
    @user.name = 'blar'
    @user.email = 'aaa@bmail.com'
    @user.password = @user.password_confirmation = ""
    @user.save
    assert_not @user.valid?
  end 
end
