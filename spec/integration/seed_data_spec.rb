require 'pathname'
require Pathname(__FILE__).dirname.expand_path.parent + 'spec_helper'

class CategoryWithSeed
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  seed_data do
    create :name => "Music"
    create :name => "Videos"
  end

end

class CategoryWithoutSeed
  include DataMapper::Resource

  property :id, Serial
  property :name, String
end

if HAS_SQLITE3 || HAS_MYSQL || HAS_POSTGRES
  describe 'DataMapper::SeedData' do
    it "creates seed data" do
      CategoryWithSeed.auto_migrate!
      CategoryWithSeed.all.size.should == 2
      CategoryWithSeed.first.name.should == "Music"
    end

    it "doesnt blow up when no seed data is given" do
      CategoryWithoutSeed.auto_migrate!
      CategoryWithoutSeed.first.should be_nil
    end

    it "is seedable from DataMapper.auto_migrate!" do
      DataMapper.auto_migrate!
      CategoryWithSeed.all.size.should == 2
      CategoryWithSeed.first.name.should == "Music"
      CategoryWithoutSeed.first.should be_nil
    end
  end
end
