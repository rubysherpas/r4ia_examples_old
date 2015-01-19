FactoryGirl.define do
  factory :asset do
    transient do
      file "spec/fixtures/speed.txt"
    end

    asset { File.open file }
  end
end