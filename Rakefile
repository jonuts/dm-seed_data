require 'pathname'
require 'rubygems'

ROOT    = Pathname(__FILE__).dirname.expand_path
JRUBY   = RUBY_PLATFORM =~ /java/
WINDOWS = Gem.win_platform?
SUDO    = (WINDOWS || JRUBY) ? '' : ('sudo' unless ENV['SUDOLESS'])

require ROOT + 'lib/dm-seed_data/version'

AUTHOR = 'jonah honeyman'
EMAIL  = 'jonah@honeyman.org'
GEM_NAME = 'dm-seed_data'
GEM_VERSION = DataMapper::SeedData::VERSION
GEM_DEPENDENCIES = [['dm-core', GEM_VERSION]]
GEM_CLEAN = %w[ log pkg coverage ]
GEM_EXTRAS = { :has_rdoc => true, :extra_rdoc_files => %w[ README.txt LICENSE TODO History.txt ] }

PROJECT_NAME = 'dm-seed_data'
PROJECT_URL  = "http://github.com/jonuts/dm-seed_data"
PROJECT_DESCRIPTION = PROJECT_SUMMARY = 'Add default data to your tables at the model level'

[ ROOT, ROOT.parent ].each do |dir|
  Pathname.glob(dir.join('tasks/**/*.rb').to_s).each { |f| require f }
end
