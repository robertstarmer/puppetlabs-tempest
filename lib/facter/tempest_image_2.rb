# glance_images.rb
# glance managed images facts

Facter.add(:tempest_image_2) do
  setcode do
    images = []
    output = Facter::Util::Resolution.exec("glance index -I admin -K Cisco123 -T openstack -N http://192.168.200.40:5000/v2.0/ | grep tempest-2")
    output.each_line do |line|
      split_line = line.split(" ")[0]
      images.push(split_line) 
    end
    images[0]
  end
end
