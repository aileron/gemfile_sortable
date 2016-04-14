# frozen_string_literal: true
require 'gemfile_sortable/version'

module GemfileSortable
  def self.sort
    allgems = {}
    bunlder = Bundler::Definition.build('Gemfile', nil, nil)
    bundler.dependencies.each do |gem|
      allgems[gem.groups] |= []
      allgems[gem.groups] << gem
    end

    result = ''
    result << '# frozen_string_literal: true' << "\n"
    result << "\n"
    result << "ruby '#{bunlder.ruby_version.version}'\n" if bunlder.ruby_version
    result << "\n"

    allgems.sort.each do |groups, gems|

      gems.sort_by! { |gem| gem.name }
      
    end
  end
end
