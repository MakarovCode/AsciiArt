require "mini_magick"

class AsciiArt

  attr_accessor :path, :inverted, :size, :art

  # Make sure size is in this format 100x100 or 50x600
  def initialize(path, inverted=nil, size=nil)
    @path = path
    @inverted = inverted
    @size = size
  end

  def convert
    image = MiniMagick::Image.open(@path)
    image.colorspace "Gray"

    width = image.data["geometry"]["width"].to_i
    height = image.data["geometry"]["height"].to_i

    unless @size.nil?
      begin
        image.resize @size
        width = @size.split("x")[0].to_i
        height = @size.split("x")[1].to_i
      rescue
        puts "Using image original size since size attribute is not in the correct format (200x300)"
      end
    end

    width = width - (width % 2)
    height = height - (height % 4)

    pixels = image.get_pixels

    art = ""


    height = image.data["geometry"]["height"].to_i
    height = height - (height % 4)


    (0..height-4).step(4).each do |i|
      art += ""
      (0..width-1).step(2).each do |j|
        chunk_binary = ""

        (0..3).each do |ai|
          (0..1).each do |aj|

            if pixels[i+ai][j+aj][0] < 80
              if @inverted.nil?
                chunk_binary += "1"
              else
                chunk_binary += "0"
              end
            else
              if @inverted.nil?
                chunk_binary += "0"
              else
                chunk_binary += "1"
              end
            end

          end
        end

        braille.each do |chara|
          if chunk_binary == chara[1]
            art += "#{chara[0]}"
          end
        end

      end
      art += "\n"
    end

    art += ""

    @art = art

  end

  private

  def braille
    [["⠀", "00000000"],["⠁", "10000000"],["⠂", "00100000"],["⠃", "10100000"],["⠄", "00001000"],["⠅", "10001000"],["⠆", "00001010"],["⠇", "10101000"],["⠈", "01000000"],["⠉", "11000000"],["⠊", "01100000"],["⠋", "11100000"],["⠌", "01001000"],["⠍", "11001000"],["⠎", "01101000"],["⠏", "11101000"],["⠐", "00010000"],["⠑", "10010000"],["⠒", "00110000"],["⠓", "10110000"],["⠔", "00011000"],["⠕", "10011000"],["⠖", "00111000"],["⠗", "10111000"],["⠘", "01010000"],["⠙", "11010000"],["⠚", "01100000"],["⠛", "11110000"],["⠜", "01011000"],["⠝", "11011000"],["⠞", "01111000"],["⠟", "11111000"],["⠠", "00000100"],["⠡", "10000100"],["⠢", "00100100"],["⠣", "10100100"],["⠤", "00001100"],["⠥", "10001100"],["⠦", "00101100"],["⠧", "10101100"],["⠨", "01000100"],["⠩", "11000100"],["⠪", "01100100"],["⠫", "11010100"],["⠬", "01001100"],["⠭", "11001100"],["⠮", "01101100"],["⠯", "11101100"],["⠰", "00010100"],["⠱", "10010100"],["⠲", "00110100"],["⠳", "10110100"],["⠴", "00011100"],["⠵", "10011100"],["⠶", "00111100"],["⠷", "10111100"],["⠸", "01010100"],["⠹", "11010100"],["⠺", "01110100"],["⠻", "11110100"],["⠼", "01011100"],["⠽", "11011100"],["⠾", "01111100"],["⠿", "11111100"],["⡀", "00000010"],["⡁", "10000010"],["⡂", "00100010"],["⡃", "10100010"],["⡄", "00001010"],["⡅", "10001010"],["⡆", "00101010"],["⡇", "10101010"],["⡈", "01000010"],["⡉", "11000010"],["⡊", "01100010"],["⡋", "11100010"],["⡌", "01001010"],["⡍", "11001010"],["⡎", "01101010"],["⡏", "11101010"],["⡐", "00010010"],["⡑", "10010010"],["⡒", "00110010"],["⡓", "10110010"],["⡔", "00011010"],["⡕", "10011010"],["⡖", "00111010"],["⡗", "10111010"],["⡘", "01010010"],["⡙", "11010010"],["⡚", "01110010"],["⡛", "11110010"],["⡜", "01011010"],["⡝", "11011010"],["⡞", "01111010"],["⡟", "11111010"],["⡠", "00000110"],["⡡", "10000110"],["⡢", "00100110"],["⡣", "10100110"],["⡤", "00001110"],["⡥", "10001110"],["⡦", "00101110"],["⡧", "10101110"],["⡨", "01000110"],["⡩", "11000110"],["⡪", "01100110"],["⡫", "11100110"],["⡬", "01001110"],["⡭", "11001110"],["⡮", "01101110"],["⡯", "11101110"],["⡰", "00010110"],["⡱", "10010110"],["⡲", "00110110"],["⡳", "10110110"],["⡴", "00011110"],["⡵", "10011110"],["⡶", "00111110"],["⡷", "10111110"],["⡸", "01010110"],["⡹", "11010110"],["⡺", "01110110"],["⡻", "11110110"],["⡼", "01011110"],["⡽", "11011110"],["⡾", "01111110"],["⡿", "11111110"],["⢀", "00000001"],["⢁", "10000001"],["⢂", "00100001"],["⢃", "10100001"],["⢄", "00001001"],["⢅", "10001001"],["⢆", "00101001"],["⢇", "10101001"],["⢈", "01000001"],["⢉", "11000001"],["⢊", "01100001"],["⢋", "11100001"],["⢌", "01001001"],["⢍", "11001001"],["⢎", "01101001"],["⢏", "11101001"],["⢐", "00010001"],["⢑", "10010001"],["⢒", "00110001"],["⢓", "10110001"],["⢔", "00011001"],["⢕", "10011001"],["⢖", "00111001"],["⢗", "10111001"],["⢘", "01010001"],["⢙", "11010001"],["⢚", "01110001"],["⢛", "11110001"],["⢜", "01011001"],["⢝", "11011001"],["⢞", "01111001"],["⢟", "11111001"],["⢠", "00000101"],["⢡", "10000101"],["⢢", "00100101"],["⢣", "10100101"],["⢤", "00001101"],["⢥", "10001101"],["⢦", "00101101"],["⢧", "10101101"],["⢨", "01000101"],["⢩", "11000101"],["⢪", "01100101"],["⢫", "11100101"],["⢬", "01001101"],["⢭", "11001101"],["⢮", "01101101"],["⢯", "11101101"],["⢰", "00010101"],["⢱", "10010101"],["⢲", "00110101"],["⢳", "10110101"],["⢴", "00011101"],["⢵", "10011101"],["⢶", "00111101"],["⢷", "10111101"],["⢸", "01010101"],["⢹", "11010101"],["⢺", "01110101"],["⢻", "11110101"],["⢼", "01011101"],["⢽", "11011101"],["⢾", "01111101"],["⢿", "11111101"],["⣀", "00000011"],["⣁", "10000011"],["⣂", "00100011"],["⣃", "10100011"],["⣄", "00001011"],["⣅", "10001011"],["⣆", "00101011"],["⣇", "10101011"],["⣈", "01000011"],["⣉", "11000011"],["⣊", "01100011"],["⣋", "11100011"],["⣌", "01001011"],["⣍", "11001011"],["⣎", "01101011"],["⣏", "11101011"],["⣐", "00010011"],["⣑", "10010011"],["⣒", "00110011"],["⣓", "10110011"],["⣔", "00101011"],["⣕", "10011011"],["⣖", "00111011"],["⣗", "10111011"],["⣘", "01010011"],["⣙", "11010011"],["⣚", "01110011"],["⣛", "11110011"],["⣜", "01011011"],["⣝", "11011011"],["⣞", "01111011"],["⣟", "11111011"],["⣠", "00000111"],["⣡", "10000111"],["⣢", "00100111"],["⣣", "10100111"],["⣤", "00001111"],["⣥", "10001111"],["⣦", "00101111"],["⣧", "10101111"],["⣨", "01000111"],["⣩", "11000111"],["⣪", "01100111"],["⣫", "11100111"],["⣬", "01001111"],["⣭", "00110011"],["⣮", "01101111"],["⣯", "11101111"],["⣰", "00010111"],["⣱", "10010111"],["⣲", "00110111"],["⣳", "10110111"],["⣴", "00011111"],["⣵", "10011111"],["⣶", "00111111"],["⣷", "10111111"],["⣸", "01010111"],["⣹", "11010111"],["⣺", "01110111"],["⣻", "11110111"],["⣼", "01011111"],["⣽", "11011111"],["⣾", "01111111"],["⣿", "11111111"]]
  end
end
