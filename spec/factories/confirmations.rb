FactoryGirl.define do
  factory :confirmation do
    confirmed false
    confirmable_type "MyString"
    confirmable_id 1
  end
end
