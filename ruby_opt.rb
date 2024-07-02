def longest_consecutive_sequence(nums):
    if not nums:
        return []

    max_sequence = []
    current_sequence = []

    for i in range(len(nums)):
        if not current_sequence or nums[i] == current_sequence[-1] + 1:
            current_sequence.append(nums[i])
        elif nums[i] != current_sequence[-1]:  # Avoid duplicates in the sequence
            if len(current_sequence) > len(max_sequence):
                max_sequence = current_sequence
            current_sequence = [nums[i]]

    # Final check at the end of the loop
    if len(current_sequence) > len(max_sequence):
        max_sequence = current_sequence

    return max_sequence

# Example usage:
nums = [-9, -8, 7, -4, -3, -2, 0, 8, 6, 5, 4, 1, 2, 3, 4, 5, 0, 7, 6]
print(longest_consecutive_sequence(nums))  # Output: [1, 2, 3, 4, 5]
 longest_consecutive_sequence(nums):
    if not nums:
        return []

    # Dictionary to store the length of sequences ending at each number
    sequence_lengths = {}
    max_length = 0
    best_start = None

    for num in nums:
        if num not in sequence_lengths:
            # Check if this number can extend a sequence from num - 1
            left_length = sequence_lengths.get(num - 1, 0)
            # Check if this number can start a new sequence that num + 1 extends
            right_length = sequence_lengths.get(num + 1, 0)

            # The new length of the sequence that num is part of
            new_length = left_length + 1 + right_length

            # Update the sequences
            sequence_lengths[num] = new_length
            sequence_lengths[num - left_length] = new_length
            sequence_lengths[num + right_length] = new_length

            # Track the maximum sequence length and its starting number
            if new_length > max_length:
                max_length = new_length
                best_start = num - left_length

    return [best_start + i for i in range(max_length)]

# Example usage:
nums = [-9, -8, 7, -4, -3, -2, 0, 8, 6, 5, 4, 1, 2, 3, 4, 5, 0, 7, 6]
print(longest_consecutive_sequence(nums))  # Output: [1, 2, 3, 4, 5]
 'optparse'

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
