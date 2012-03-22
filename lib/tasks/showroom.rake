namespace :showroom do
  desc "Update showrooms for users"
  task :update => :environment do
    Showroom.outdated.map(&:user).map(&:populate_showroom) if Showroom.outdated.count > 0
  end
end