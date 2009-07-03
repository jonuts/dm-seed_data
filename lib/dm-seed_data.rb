# Needed to import datamapper and other gems
require 'rubygems'
require 'pathname'

# Add all external dependencies for the plugin here
gem 'dm-core', '0.10.0'
require 'dm-core'

DataMapper::Model.class_eval do
  def seed_data(&block)
    @seed_data = block
  end

  def auto_migrate_up!(repository_name=self.repository_name)
    super(repository_name)
    @seed_data.call if @seed_data
  end
end
  
