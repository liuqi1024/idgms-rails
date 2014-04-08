namespace :user do
  desc "initial user"
  task :initial => :environment do
    Operation::OPERATONS.each do |o|
      Operation.create :name => o
    end
    
    role = Role.create(:name => '系统管理员')
    Operation.all.each do |o|
      role.operations << o
    end
    
    user = User.create(:email => 'keyboarder5211@gmail.com', :password => '11111111', :loginname => 'liuqi', :name => '刘齐')
    
    user.add_role('系统管理员')
  end

end
