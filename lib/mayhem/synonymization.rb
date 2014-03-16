require 'zlib'

class Mayhem
  class << self
    def synonymize(input)
      input.to_s.split("\s").map do |word|
        if related_terms = lookup_table[word]
          related_terms.sample
        else
          word
        end
      end.join(' ')
    end

    private

    def lookup_table
      return @lookup_table if @lookup_table

      @lookup_table = {}

      synonym_file = File.open(synonym_file_path)
      reader = Zlib::GzipReader.new(synonym_file)
      reader.readlines.first.split("\s").each do |line|
        words = line.split(',').map(&:strip)
        root = words.first
        related = words[1..-1]
        @lookup_table[root] = related
      end

      @lookup_table
    end

    def synonym_file_path
      File.join(data_directory, 'mobythes.aur.gz')
    end

    def data_directory
      specification = Gem::Specification.find_by_name('mayhem')
      File.join(specification.gem_dir, 'lib', 'data')
    end
  end
end
