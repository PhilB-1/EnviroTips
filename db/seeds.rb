User.delete_all
Tip.delete_all
Category.delete_all


User.create!(
                :email      => 'master@envirotip.com',
                :password   => 'pass',
                :phone => "3235733073" )

Tip.create!(
    :category_id => 1,
    :user_id => 1,
    :title => "Use Power Switches!",
    :description => "Many electronics still draw energy even when off. You can limit this by plugging them into power strips and turning those off when your devices are not in use." )

Tip.create!(
    :category_id => 3,
    :user_id => 1,
    :title => "Use Sides of a Page",
    :description => "Always print double sided if you can and reuse a sheet printed on one side for something else. It can also be used as scratch paper." )

Tip.create!(
    :category_id => 2,
    :user_id => 1,
    :title => "Shut Off the Shower",
    :description => "When soaping up in the shower, turn off the shower to conserve water." )

Category.create!(
    :name => "Energy" )

Category.create!(
    :name => "Water" )

Category.create!(
    :name => "Waste" )