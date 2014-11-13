require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test ":email only accepts valid emails" do
    valid_person = Person.new(email: "valid.email@msn.net", password: "password", password_confirmation: "password")

    assert valid_person.valid?

    invalid_person = Person.new(email: "invalid.email", password: "password", password_confirmation: "password")

    assert_not invalid_person.valid?
  end

  test ":email validates uniqueness" do
     skip "We need to make emails unique"
  end

end
