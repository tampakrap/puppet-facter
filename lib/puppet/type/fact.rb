Puppet::Type.newtype(:fact) do
  @doc = "Create a custom fact as text file under /etc/puppetlabs/facter/facts.d

      fact { 'environment':
        content => 'production',
        target  => 'env',
      }"


  ensurable do
    defaultvalues
    defaultto :present
  end

  newparam(:name, :namevar => true) do
    desc "The fact name"
    isnamevar
  end

  newproperty(:content) do
    desc "The content of the fact"
    defaultto 'true'
    validate do |value|
      fail("Content cannot be empty or whitespace") if munge(value).match(/^\s*$/)
    end

    munge do |value|
      value.to_s
    end

    def insync?(is)
      is == should
    end
  end

  newproperty(:target) do
    desc "Target txt file to write under /etc/puppetlabs/facter/facts.d"
    defaultto { @resource[:name] }
  end
end
