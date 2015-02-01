require 'spec_helper'

describe Puppet::Type.type(:fact).provider(:fact) do

  it "should have a default target of /etc/facter/facts.d/$name.txt" do
    described_class.new(:name => "environment").select_file == "/etc/facter/facts.d/enironment.txt"
  end

  it "should have a target of /etc/facter/facts.d/$target.txt when target is specified" do
    described_class.new(:name => "environment", :target => "env").select_file == "/etc/facter/facts.d/env.txt"
  end
end
