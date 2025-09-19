# frozen_string_literal: true

seed_log "Seeding Taxonomies..."

taxonomies = [
  { name: "Audio", slug: "audio" },
  { name: "Business & Money", slug: "business-and-money" },
  { name: "Comics & Graphic Novels", slug: "comics-and-graphic-novels" },
  { name: "Design", slug: "design" },
  { name: "Education", slug: "education" },
  { name: "Fiction Books", slug: "fiction-books" },
  { name: "Films", slug: "films" },
  { name: "Gaming", slug: "gaming" },
  { name: "Music & Sound Design", slug: "music-and-sound-design" },
  { name: "Photography", slug: "photography" },
  { name: "Self Improvement", slug: "self-improvement" },
  { name: "Software", slug: "software" },
  { name: "Writing & Publishing", slug: "writing-and-publishing" },
  { name: "Other", slug: "other" }
]

taxonomies.each do |taxonomy_attrs|
  Taxonomy.find_or_create_by!(slug: taxonomy_attrs[:slug]) do |t|
    t.name = taxonomy_attrs[:name]
  end
end

seed_log "Taxonomies seeded."
