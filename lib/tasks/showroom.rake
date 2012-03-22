namespace :showroom do
  desc "Update showrooms for users (will create new showrooms for users, which date of creation is more, whan one month)"
  task :update => :environment do
    Showroom.outdated.map(&:user).map(&:populate_showroom) if Showroom.outdated.count > 0
  end
end