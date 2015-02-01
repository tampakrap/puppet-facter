require 'puppetx/filemapper'

Puppet::Type.type(:fact).provide(:fact) do

  include PuppetX::FileMapper

  desc "The fact provider to create custom facts"

  @unlink_empty_files = true

  def select_file
    "/etc/facter/facts.d/#{@property_hash[:target]}.txt"
  end

  def self.target_files
    Dir["/etc/facter/facts.d/*.txt"]
  end

  def self.parse_file(filename, contents)
    return [{}] if contents.nil?

    result = {}
    re = /^(.+?)=(.+)$/
    line = contents.lines.first

    if match_data = re.match(line.chomp)
      result[:name] = match_data[1]
      result[:content] = match_data[2]
      result[:target] = File.basename(filename, ".txt")
    end

    return [result]
  end

  def self.format_file(filename, providers)
    return "" if providers.empty?

    result = ""
    provider = providers[0]
    basename = File.basename(filename, ".txt")

    if provider.ensure == :present and provider.target == basename
      result = "#{provider.name}=#{provider.content}\n"
    end

    return result
  end
end
