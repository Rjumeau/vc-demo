require 'factory_bot'
include FactoryBot::Syntax::Methods

User.destroy_all

puts "Create users..."

create_list(:user, 30)
create(:user, :batch_manager)
create(:user, :without_image)

puts "Done"
