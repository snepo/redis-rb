require 'benchmark'
$:.push File.join(File.dirname(__FILE__), 'lib')
require 'redis'

times = 20000

@r = Redis.new
@r['foo'] = "The first line we sent to the server is some text"
Benchmark.bmbm do |x|
  x.report("get") { 20000.times { @r['foo'] } }
  x.report("set") { 20000.times { @r['foo'] = "The first line we sent to the server is some text"} }
end