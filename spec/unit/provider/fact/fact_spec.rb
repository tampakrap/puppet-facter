require 'spec_helper'

describe Puppet::Type.type(:fact).provider(:fact) do
  it "should remove empty files" do
    described_class.unlink_empty_files == true
  end

  context "when parsing" do
    props = described_class.parse_file("/etc/facter/facts.d/env.txt", "environment=production")
    prop = props.find { |h| h[:name] == "environment" }

    it "should detect name correctly" do
      prop.should_not be_nil
    end

    it "should detect content correctly" do
      prop.should include(:content => "production")
    end

    it "should detect target correctly" do
      prop.should include(:target => "env")
    end

    context "it should handle invalid inputs" do
      invalid_filenames = [nil, "", " ", "foo.bar", "/etc/facter/facts.d/foo.bar"]
      invalid_contents = [nil, "", " ", "=", "foo=", "=bar"]

      invalid_filenames.product(invalid_contents).each do |filename, content|
        it "should parse (#{filename}, #{content}) to an empty hash" do
          described_class.parse_file(filename, content).should == [{}]
        end
      end
    end
  end

  context "when formatting" do
    let(:environment_provider) do
      stub("environment_provider",
           :name => "environment",
           :ensure => :present,
           :content => "production",
           :target => "env"
          )
    end

    let(:environment_content) { described_class.format_file("/etc/facter/facts.d/env.txt", [environment_provider]) }

    it "should write content correctly" do
      environment_content.should == "environment=production\n"
    end

    let(:absent_provider) do
      stub("absent_provider",
           :name => "environment",
           :ensure => :absent,
           :content => "production",
           :target => "env"
          )
    end

    it "should cleanup absent resources" do
      described_class.format_file("/etc/facter/facts.d/env.txt", [absent_provider]).should be_empty
    end

    let(:nonexistent_provider) do
      stub("nonexistent_provider",
           :name => "environment",
           :ensure => :present,
           :content => "production",
           :target => "environment"
          )
    end

    it "should cleanup nonexistent resources" do
      described_class.format_file("/etc/facter/facts.d/env.txt", [nonexistent_provider]).should be_empty
    end
  end
end
