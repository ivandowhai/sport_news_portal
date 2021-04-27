# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Page.create([
              {
                name: 'About Sports Hub',
                slug: 'about-sports-hub',
                category: Page::CATEGORY_COMPANY_INFO,
                order: 1,
                enabled: true
              },
              {
                name: 'News / In the Press',
                slug: 'news-in-the-press',
                category: Page::CATEGORY_COMPANY_INFO,
                order: 2,
                enabled: true
              },
              {
                name: 'Advertising / Sports Blogger Ad Network',
                slug: 'advertising-sports-blogger-ad-network',
                category: Page::CATEGORY_COMPANY_INFO,
                order: 3,
                enabled: true
              },
              {
                name: 'Events',
                slug: 'events',
                category: Page::CATEGORY_COMPANY_INFO,
                order: 4,
                enabled: true
              },
              {
                name: 'Contact Us',
                slug: 'contact-us',
                category: Page::CATEGORY_COMPANY_INFO,
                order: 5,
                enabled: true
              },
              {
                name: 'Privacy Policy',
                slug: 'privacy-policy',
                category: Page::CATEGORY_CONTRIBUTORS,
                order: 1,
                enabled: true
              },
              {
                name: 'Terms and Conditions',
                slug: 'terms-and-conditions',
                category: Page::CATEGORY_CONTRIBUTORS,
                order: 2,
                enabled: true
              }
            ])