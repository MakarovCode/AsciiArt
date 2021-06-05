# AsciiArt
This is a Graphic implementation of the infamous Ruby command-line game RubyWarrior using Ruby on Rails.

# DEMO
[RubyWarrior GUI](https://rubywarrior.geekoi.com/) - Play the game

# Class Gist
[Original Game and Repo](https://github.com/ryanb/ruby-warrior) - Gist for the ruby class

# Calling the Class

```ruby
# First parameter is the full path of the image to convert
# Second parameter is to turn the white like pixels to black
# Third parameter is the size, nil will get you full size image
a = AsciiArt.new "full/path/to/image", true, "100x100"
puts a.convert

# Important for this class to work you must install the gem mini_magick

gem "mini_magick"
```
