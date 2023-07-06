require 'json'

class JsonHandler
  def self.write_to_json(data, class_type)
    file_name = "#{class_type.to_s.downcase}s.json"
    existing_data = read_from_json(file_name) || []
    updated_data = existing_data + data.map(&:to_hash)

    File.write(file_name, JSON.pretty_generate(updated_data))

    puts "#{class_type.to_s.capitalize} data written to #{file_name} successfully!"
  end

  def self.read_from_json(file_name)
    return unless File.exist?(file_name)

    file_content = File.read(file_name)
    JSON.parse(file_content, symbolize_names: true)
  end
end
