# ruby_gems namespace rake tasks with it
namespace :ruby_gems do
  require_relative "../scraper/ruby_gems_scraper"

  # Get all gems from ruby gems
  # Can call for a single letter and x amount of gems:
  #   ex. rake scrape:gems[F, 20]
  task :gems, [:letters_to_traverse, :upsert_limit] => :environment do |t, args|
    options = args.to_h
    if args.letters_to_traverse
      options[:letters_to_traverse] = args.letters_to_traverse.split(" ")
    end

    RubyGemsScraper.upsert_all_gems(options)
  end

  task :top_100 => :environment do |t|
    RubyGemsScraper.upsert_top_100_gems
  end
end
