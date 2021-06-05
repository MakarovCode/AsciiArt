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

# HOW TO INSTALL

```ruby
# 1. Clone the repo

git clone https://github.com/MakarovCode/AsciiArt.git

# 2. Run bundle

bundle

# 3. Run the DB

rails db:create db:migrate db:seed

# Type localhost:3000
```
