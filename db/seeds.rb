# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

company_info = PageCategory.first_or_create({name: "Company info", enabled: true})
contributors = PageCategory.first_or_create({name: "Contributors", enabled: true})

Page.first_or_create(
  [
    {
      name: "About Sports Hub",
      slug: "about-sports-hub",
      page_category: company_info,
      priority: 1,
      enabled: true
    },
    {
      name: "News / In the Press",
      slug: "news-in-the-press",
      page_category: company_info,
      priority: 2,
      enabled: true
    },
    {
      name: "Advertising / Sports Blogger Ad Network",
      slug: "advertising-sports-blogger-ad-network",
      page_category: company_info,
      priority: 3,
      enabled: true
    },
    {
      name: "Events",
      slug: "events",
      page_category: company_info,
      priority: 4,
      enabled: true
    },
    {
      name: "Contact Us",
      slug: "contact-us",
      page_category: company_info,
      priority: 5,
      enabled: true
    },
    {
      name: "Privacy Policy",
      slug: "privacy-policy",
      page_category: contributors,
      priority: 1,
      enabled: true
    },
    {
      name: "Terms and Conditions",
      slug: "terms-and-conditions",
      page_category: contributors,
      priority: 2,
      enabled: true
    }
  ]
)
