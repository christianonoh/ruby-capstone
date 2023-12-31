require 'json'

class JsonHandler
  def self.write_to_json(data, class_type)
    file_name = "./database/#{class_type.to_s.downcase}s.json"
    existing_data = read_from_json(file_name) || []
    updated_data = existing_data + data.map(&:to_hash)

    File.write(file_name, JSON.pretty_generate(updated_data))
  end

  def self.read_from_json(file_name)
    return unless File.exist?(file_name)

    file_content = File.read(file_name)
    JSON.parse(file_content, symbolize_names: true)
  end
end
