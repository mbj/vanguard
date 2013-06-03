spec_dir = File.expand_path('..', __FILE__)

$LOAD_PATH << spec_dir
$LOAD_PATH << File.join(spec_dir,'integration')

require 'vanguard'

%w[unit integration].each do |spec_type|
  Dir[File.join(spec_dir, spec_type, '**', '*.rb')].each { |spec| require spec }
end
