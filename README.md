# ContestToyRobot

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/contest_toy_robot`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'contest_toy_robot', github: 'majioa/contest_toy_robot'
```

Or use it yourself previously cloned with git:

    $ git clone https://github.com/majioa/contest_toy_robot.git

And then execute:

    $ bundle

## Usage

Use gem's binary by passing command list to standard input like follows:

    $ bundle exec toyrobot <<< "PLACE 0,0,NORTH
    MOVE
    REPORT
    "
    0,1,NORTH

You are able to to see which commands are executed by passing '-v' as an argument:

    $ bundle exec toyrobot -v <<< "PLACE 0,0,NORTH
    MOVE
    REPORT
    "
    > PLACE 0,0,NORTH
    > MOVE
    > REPORT
    0,1,NORTH

Also you can use predefned test samples data as follows:

    $ cat SAMPLES | bundle exec toyrobot
    0,1,NORTH
    0,0,WEST
    3,3,NORTH

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Test

Run specs as follows:

    $ bundle exec rake spec

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/majioa/contest_toy_robot.
