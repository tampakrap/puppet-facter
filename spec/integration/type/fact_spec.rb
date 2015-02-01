require 'spec_helper'

describe Puppet::Type.type(:fact) do

  context "when validating content" do
    it "should be mandatory" do
      expect { described_class.new(:name => "environment") }.to raise_error
    end

    it "should reject empty string" do
      expect { described_class.new(:name => "environment", :content => "") }.to raise_error
    end

    it "should reject only whitespace" do
      expect { described_class.new(:name => "environment", :content => " ") }.to raise_error
    end

    it "should accept other values" do
      expect { described_class.new(:name => "environment", :content => "production") }.to_not raise_error
      expect { described_class.new(:name => "environment", :content => " production") }.to_not raise_error
    end
  end

  context "when validating target" do
    resource = described_class.new(:name => "environment", :content => "production")

    it "can be optional" do
      expect { resource }.to_not raise_error
    end

    it "should have :name as default value" do
      resource.should(:target).should == resource[:name]
    end

    it "should accept specified values" do
      described_class.new(:name => "environment", :content => "production", :target => "env").should(:target).should == "env"
    end
  end
end
