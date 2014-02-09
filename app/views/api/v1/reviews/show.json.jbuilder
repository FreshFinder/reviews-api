json.array! @reviews do |review|
  json.name review.name
  json.email review.email
  json.title review.title
  json.content review.content
end

