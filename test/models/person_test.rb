require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test ":email only accepts valid emails" do
    valid_person = Person.new(email: "valid.email@msn.net", password: "password", password_confirmation: "password")

    assert valid_person.valid?

    invalid_person = Person.new(email: "invalid.email", password: "password", password_confirmation: "password")

    assert_not invalid_person.valid?
  end

  test ":email validates uniqueness" do
     valid_person = Person.new(email: "test@example.com", password: "password", password_confirmation: "password")

     assert valid_person.save

     invalid_person = Person.new(email: "test@example.com", password: "password", password_confirmation: "password")

     assert_not invalid_person.save
  end

  test ":tokens are not allowed to be below 0" do 
    person = Person.new(email: "seb@example.com", password: "password", password_confirmation: "password")
    assert_equal(false,person.update_attributes(tokens: -1))
  end 

end
