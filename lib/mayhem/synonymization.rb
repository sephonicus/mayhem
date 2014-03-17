require 'zlib'

class Mayhem
  class << self
    def synonymize(input)
      text = input.to_s
      components = text.split(/\b/)
      components.map do |component|
        if component =~ /\A\w+\z/
          synonym(component) || component
        else
          component
        end
      end.join
    end

    private

    def synonym(word)
      candidate_list = lookup_table[word]
      candidate = candidate_list.sample if candidate_list
      if candidate && candidate != ''
        candidate
      end
    end

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
