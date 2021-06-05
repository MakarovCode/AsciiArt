# AsciiArt
Turn images into Ascii Art

# DEMO
[The Ascii Art](https://theasciiart.herokuapp.com/) - Heroku Demo Application

# Class Gist
[Get Gist](https://gist.github.com/MakarovCode/c4101a7a528341a613966cd6974fb928) - Gist for the ruby class

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
