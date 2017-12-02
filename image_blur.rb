class Image
  def initialize(data)
    @data = data 
  end

  def output_image(rows = @data)
    rows.each do |row|
      puts row.join
    end
  end

  def blur_image
    original_image_data = Marshal.dump(@data)
    blurred_image = Marshal.load(original_image_data)

    @data.each_with_index do |outer, outer_index|
      outer.each_with_index do |inner, inner_index|
        if inner == 1
          # up
          if blurred_image[outer_index - 1][inner_index]
            blurred_image[outer_index - 1][inner_index] = 1
          end

          # right
          if blurred_image[outer_index][inner_index + 1]
            blurred_image[outer_index][inner_index + 1] = 1
          end
          
          # down
          if blurred_image[outer_index + 1][inner_index]
            blurred_image[outer_index + 1][inner_index] = 1
          end

          # left
          if blurred_image[outer_index][inner_index - 1]
            blurred_image[outer_index][inner_index - 1] = 1
          end
        end
      end
    end
    
    output_image(blurred_image)

  end
  
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

image.blur_image
