$:.unshift File.join(File.dirname(__FILE__), "/../../lib")

require 'spec/expectations'
require 'tempfile'
require File.dirname(__FILE__) + '/../../spec/ruby_forker'
require File.dirname(__FILE__) + '/matchers/smart_match'


module RspecWorld
  include Spec::Expectations
  include Spec::Matchers
  include RubyForker

  def spec(args, stderr)
    ruby("#{File.dirname(__FILE__) + '/../../bin/spec'} #{args}", stderr)
  end

  def cmdline(args, stderr)
    ruby("#{File.dirname(__FILE__) + '/../../resources/helpers/cmdline.rb'} #{args}", stderr)
  end
end

World do |world|
  world.extend(RspecWorld)
  world
end
