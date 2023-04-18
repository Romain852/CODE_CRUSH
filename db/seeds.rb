
# This file should contain all the record creation needed to seed the database with its default values.
puts "creating courses"
courses = [  "Ruby",  "CSS",  "JavaScript",  "Databases",  "Communication",  "Product Management",  "DevOps",  "Entrepreneurship",  "HTML",  "UX Design",  "Data Science",  "Python",  "Rails"]

courses.each do |course|
  Course.create(
    title: course,
    description: Faker::Lorem.paragraph(sentence_count: 4),
    price: rand(500..2500),
    category: ["Fullstack", "Data"].sample,
    syllabus: [Faker::Lorem.paragraph(sentence_count: 10), Faker::Lorem.paragraph(sentence_count: 10), Faker::Lorem.paragraph(sentence_count: 10)],
    user: User.all.sample,
    session_start: Time.now,
    session_end: Time.now + 14.days
  )
end

puts "finished creating #{courses.length} courses"
