categories = PageCategory.first_or_create(
  [
    {name: "Company info", enabled: true},
    {name: "Contributors", enabled: true}
  ]
)

Page.first_or_create(
  [
    {
      name: "About Sports Hub",
      slug: "about-sports-hub",
      page_category: categories[0],
      priority: 1,
      enabled: true
    },
    {
      name: "News / In the Press",
      slug: "news-in-the-press",
      page_category: categories[0],
      priority: 2,
      enabled: true
    },
    {
      name: "Advertising / Sports Blogger Ad Network",
      slug: "advertising-sports-blogger-ad-network",
      page_category: categories[0],
      priority: 3,
      enabled: true
    },
    {
      name: "Events",
      slug: "events",
      page_category: categories[0],
      priority: 4,
      enabled: true
    },
    {
      name: "Contact Us",
      slug: "contact-us",
      page_category: categories[0],
      priority: 5,
      enabled: true
    },
    {
      name: "Privacy Policy",
      slug: "privacy-policy",
      page_category: categories[1],
      priority: 1,
      enabled: true
    },
    {
      name: "Terms and Conditions",
      slug: "terms-and-conditions",
      page_category: categories[1],
      priority: 2,
      enabled: true
    }
  ]
)

Locale.first_or_create(
  [
    {code: "en", enabled: true},
    {code: "ua", enabled: true}
  ]
)

SiteSetting.first_or_create(
  [
    {
      key: SiteSetting::MOST_POPULAR,
      settings: {
        period: SiteSetting::PERIOD_MONTH,
        enabled: true
      }
    },
    {
      key: SiteSetting::MOST_COMMENTED,
      settings: {
        period: SiteSetting::PERIOD_MONTH,
        enabled: true
      }
    }
  ]
)
