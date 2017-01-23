# frozen_string_literal: true
require 'data_helpers/version'

require 'faker'
require 'csv'

module DataHelpers
  module DelimitedRow
    def self.headers(delimiter)
      %w(LastName FirstName Gender FavoriteColor DateOfBirth).join(delimiter)
    end

    def self.fields(delimiter)
      [
        Faker::Name.last_name.split(/\s+/).map(&:capitalize).join.gsub(/\W/, ''),
        Faker::Name.first_name.split(/\s+/).map(&:capitalize).join.gsub(/\W/, ''),
        %w(F M).sample,
        Faker::Color.color_name.split(/\s+/).map(&:capitalize).join,
        Faker::Date.send(%i(forward backward).sample, 1825).strftime('%-m/%-d/%Y')
      ].join(delimiter)
    end
  end

  class DelimitedFileWriter
    DELIMITERS = { comma: ', ', space: ' ', pipe: ' | ' }.freeze
    attr_accessor :delimiter, :lines, :headers, :verbose

    def initialize(delimiter:, lines:, headers:, verbose:)
      @verbose = verbose
      @delimiter = DELIMITERS[delimiter]
      @lines = lines
      @headers = headers
    end

    def call
      if %i(only prepend).include?(headers)
        STDERR.puts('Print delimited headers') if verbose
        STDOUT.puts(DelimitedRow.headers(delimiter))
      end

      if headers == :only
        STDERR.puts('Print only delimited headers')
      else
        STDERR.puts('Print delimited fields') if verbose
        lines.times do
          STDERR.write('.') if verbose
          STDOUT.puts(DelimitedRow.fields(delimiter))
        end
        STDERR.puts if verbose
      end
    end
  end
end
