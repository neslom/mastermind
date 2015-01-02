require 'bundler'
Bundler.require # goes to gemfile and requires all of listed gems

task :test do
  Dir.glob('./test/**/*_test.rb') { |file| require file }
end

# DSL = Domain Specific Language
# allows for keywords like 'task'
# Dir == directory
# .glob == find every file in this directory meeting this criteria
