# Minitest::Bundler::Bug

A proof of concept of a bug in bundler

### Overview
I am attempting to publish a gem and have come across a problem. While minitest should be available, I am forced to declare it as a development dependency in the gem spec if I run `bundle exec rake test` as opposed to `rake test`. When running `rake test` the load path is able to bring in the minitest bundled gem.

I have posted my [bundler env to a public gist](https://gist.github.com/ebenoist/2b54075341f8fc45a80e) and have created a [test project](https://github.com/ebenoist/minitest-bundler-bug) that displays the bug.

#### Without Bundler
```BASH
[master+][~/development/minitest-bundler-bug]❥ rake test
/Users/ebenoist/.rbenv/versions/2.1.2/bin/ruby -I"lib:lib" -I"/Users/ebenoist/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.4.2/lib" "/Users/ebenoist/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.4.2/lib/rake/rake_test_loader.rb" "test/bug_test.rb"
Run options: --seed 39836

# Running:

.

Finished in 0.001396s, 716.3324 runs/s, 716.3324 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```

### With Bundler
```BASH
[master][~/development/minitest-bundler-bug]❥ bundle exec rake test
/Users/ebenoist/.rbenv/versions/2.1.2/bin/ruby -I"lib:lib" -I"/Users/ebenoist/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.4.2/lib" "/Users/ebenoist/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.4.2/lib/rake/rake_test_loader.rb" "test/bug_test.rb"
/Users/ebenoist/development/minitest-bundler-bug/test/bug_test.rb:1:in `require': cannot load such file -- minitest (LoadError)
  from /Users/ebenoist/development/minitest-bundler-bug/test/bug_test.rb:1:in `<top (required)>'
  from /Users/ebenoist/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.4.2/lib/rake/rake_test_loader.rb:15:in `require'
  from /Users/ebenoist/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.4.2/lib/rake/rake_test_loader.rb:15:in `block in <main>'
  from /Users/ebenoist/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.4.2/lib/rake/rake_test_loader.rb:4:in `select'
  from /Users/ebenoist/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.4.2/lib/rake/rake_test_loader.rb:4:in `<main>'
rake aborted!
Command failed with status (1): [ruby -I"lib:lib" -I"/Users/ebenoist/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.4.2/lib" "/Users/ebenoist/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.4.2/lib/rake/rake_test_loader.rb" "test/bug_test.rb" ]

Tasks: TOP => test
(See full trace by running task with --trace)
```
