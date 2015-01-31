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
    parts = contents.split("=")
    props = {}
    props[:name] = parts[0].strip
    props[:content] = parts[1].strip
    props[:target] = File.basename(filename, ".txt")
    return [props]
  end

  def self.format_file(filename, providers)
    if providers.empty?
      return ""
    else
      provider = providers[0]
      if provider.ensure == :present and
          provider.target == File.basename(filename, ".txt")
        return "#{provider.name}=#{provider.content}\n"
      else
        return ""
      end
    end
  end
end
