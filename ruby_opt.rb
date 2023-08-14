require 'optparse'

options = {}

begin
  OptionParser.new do |opts|
    opts.banner = "Usage: example.rb [options]"

    opts.on("-v", "--verbose", "Enable verbose output") do |v|
      options[:verbose] = v
    end

    opts.on("-fFILE", "--file=FILE", "Specify input file") do |file|
      options[:input_file] = file
    end

    opts.on("-h", "--help", "Prints this help") do
      puts opts
      exit
    end
  end.parse!
rescue OptionParser::MissingArgument => e
  puts "Missing argument: #{e.message}"
  exit 1
rescue OptionParser::InvalidOption => e
  puts "Invalid option: #{e.message}"
  exit 1
end

puts "Verbose mode enabled" if options[:verbose]
puts "Input file: #{options[:input_file]}" if options[:input_file]
