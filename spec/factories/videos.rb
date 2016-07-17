FactoryGirl.define do
  factory :video do |t|
    t.title "Best video"
    t.file { File.new(Rails.root.join('spec', 'files', 'bird.avi')) }
  end
end