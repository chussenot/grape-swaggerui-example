# encoding: utf-8

namespace :db do

  desc "initialize"
  task :init => [:environment] do

    def print_more
      print '.'
      STDOUT.flush
    end

    def scale
      (ENV['NB'] || 1).to_i
    end
  end

  desc "do all populate tasks"
  task :populate => [:init] do
    Rake::Task['db:populate:default'].invoke
  end

  namespace :populate do

    desc 'default: do all populate tasks'
    task :default => [
      :bands,
      :members
    ]

    desc 'create bands'
    task :bands => :init do
      puts "Creating 20 bands"
      20.times {
        Band.create!(name: Faker::HipsterIpsum.words(3).join(' '))
        print_more
      }
      puts ''
    end

    desc 'create members'
    task :members => :init do
      puts "Creating 5 members per band"
      Band.all.each do |band|
        5.times {
          Member.create!(name: Faker::Name.name, band: band)
          print_more
        }
      end
      puts ''
    end
  end
end
