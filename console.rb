require('pry-byebug')
require_relative('models/bounty.rb')
require('pp')

pp

bounty_new = Bounty.new({ 'name' => 'Fred', 'bounty_value' => '23423452', 'cashed_in' => 'false'})
bounty_new2 = Bounty.new({ 'name' => 'Tommy', 'bounty_value' => '210', 'cashed_in' => 'false'})
bounty_new.save
bounty_new2.save

bounty_new.bounty_value = '30687687'
bounty_new.update

bounty_new.delete
