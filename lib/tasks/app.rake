# frozen_string_literal: true

namespace :app do
  # Checks and ensures task is not run in production.
  task ensure_development_environment: :environment do
    raise "\nI'm sorry, I can't do that.\n(You're asking me to drop your production database.)" if Rails.env.production?
  end

  # Custom install for developement environment
  desc 'Install'
  task install: [:ensure_development_environment, 'db:migrate', 'db:test:prepare', 'db:seed', 'app:populate',
                 'spec']

  # Custom reset for developement environment
  desc 'Reset'
  task reset: [:ensure_development_environment, 'db:drop', 'db:create', 'db:migrate', 'db:test:prepare',
               'db:seed', 'app:populate']

  # Populates development data
  desc 'Populate the database with development data.'
  task populate: :environment do
    puts "#{'*' * `tput cols`.to_i}\nChecking Environment... The database will be cleared of all content before populating.\n#{'*' * `tput cols`.to_i}"
    # Removes content before populating with data to avoid duplication
    Rake::Task['db:reset'].invoke

    # INSERT BELOW

    [
      {
        name: 'Winter vibes',
        price: 500,
        quantity: 20,
        image_url: 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80'
      },
      {
        name: 'Shirts',
        price: 800,
        quantity: 20,
        image_url: 'https://images.unsplash.com/photo-1441984904996-e0b6ba687e04?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80'
      },
      {
        name: 'Trousers',
        price: 1000,
        quantity: 20,
        image_url: 'https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80'
      },
      {
        name: 'Summer',
        price: 1000,
        quantity: 20,
        image_url: 'https://images.unsplash.com/photo-1561052967-61fc91e48d79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80'
      },
      {
        name: 'Track Suits',
        price: 1000,
        quantity: 20,
        image_url: 'https://images.unsplash.com/photo-1560243563-062bfc001d68?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80'
      }
    ].each do |attributes|
      Product.create(attributes)
    end

    # INSERT ABOVE

    puts "#{'*' * `tput cols`.to_i}\nThe database has been populated!\n#{'*' * `tput cols`.to_i}"
  end
end
