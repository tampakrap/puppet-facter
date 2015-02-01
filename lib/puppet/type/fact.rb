Puppet::Type.newtype(:fact) do
  @doc = "Create a custom fact as text file under /etc/facter/facts.d

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
    defaultto ''
    validate do |value|
      fail("Content cannot be empty or whitespace") if value.match(/^\s*$/)
    end
  end

  newproperty(:target) do
    desc "Target txt file to write under /etc/facter/facts.d"
    defaultto { @resource[:name] }
  end

end
