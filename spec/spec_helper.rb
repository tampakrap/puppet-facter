require 'puppetlabs_spec_helper/module_spec_helper'

PROJECT_ROOT = File.expand_path('..', File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(PROJECT_ROOT, "lib"))

fixture_path = File.expand_path(File.join(Dir.pwd, 'spec/fixtures'))
env_module_path = ENV['MODULEPATH']
module_path = File.join(fixture_path, 'modules')
module_path = [module_path, env_module_path].join(File::PATH_SEPARATOR) if env_module_path
$LOAD_PATH.concat(Dir.glob(File.join(module_path, '*', 'lib')))
