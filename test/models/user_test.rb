require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "has a secure password" do
    user = User.create(name: "Jaina Solo", email: "jaina@bog.us", password: "idontknowren")
    refute_equal(user.password_digest, "idontknowren")
  end

  test "should not use email more than once" do
    User.create(name: "Jaina Solo", email: "jaina@bog.us", password: "idontknowren")
    user = User.create(name: "Jaina Proudmoore", email: "jaina@bog.us", password: "magictearing")
    refute user.valid?
  end

  test "should not work without name, email, and password" do
    noname = User.create(email: "theoldroyalscientist@under.net", password: "darkyetdarker")
    refute noname.valid?
    noemail = User.create(name: "James Ludd", password: "techater")
    refute noemail.valid?
    nopass = User.create(name: "Ein Secure", email: "reformingangel")
    refute nopass.valid?    
  end
end
