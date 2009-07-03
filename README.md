DM Seed Data
============

Provides a convenient way to populate your database with default data

Examples
--------

<pre>
class Category
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  seed_data do
    create :name => "Music"
    create :name => "Videos"
  end
end
</pre>


Running Category.auto_migrate! or DataMapper.auto_migrate! will recreate the table as normal, but add in your rows
  
