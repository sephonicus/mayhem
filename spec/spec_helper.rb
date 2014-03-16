class SpecHelper
  def self.test_data_directory
    specification = Gem::Specification.find_by_name('mayhem')
    File.join(specification.gem_dir, 'spec', 'test_data')
  end
end
