class Image
  def initialize(data, distance)
    @data = data
    @distance = distance
  end

  def output_image(rows = @data)
    rows.each do |row|
      puts row.join
    end
  end

  def blur_up (blurred_image, outer_index, inner_index, distance)
    (0..@distance).each do |index_to_blur|
      if !blurred_image[outer_index - index_to_blur].nil?
        if !blurred_image[outer_index - index_to_blur][inner_index].nil?
          blurred_image[outer_index - index_to_blur][inner_index] = 1
        end
      end
    end

    return blurred_image
  end

  def blur_down (blurred_image, outer_index, inner_index, distance)
    
  end

  def blur_right (blurred_image, outer_index, inner_index, distance)
    
  end
 
  def blur_left (blurred_image, outer_index, inner_index, distance)
    
  end

  def blur_image
    original_image_data = Marshal.dump(@data)
    blurred_image = Marshal.load(original_image_data)

    @data.each_with_index do |outer, outer_index|
      outer.each_with_index do |inner, inner_index|

        if inner == 1
          ups_to_do = @distance
          downs_to_do = @distance
          rights_to_do = @distance
          lefts_to_do = @distance

          # blur_up(blurred_image, outer_index, inner_index, @distance)


          # Horizontal
          (-@distance..@distance).each do |index_to_blur|
            if !original_image[outer_index + index_to_blur].nil?
              if !blurred_image[outer_index + index_to_blur][inner_index].nil?
                puts "outer: #{outer_index + index_to_blur} inner: #{inner_index}"
                blurred_image[outer_index + index_to_blur][inner_index] = 1
              end
            end
          end

        
        
        end
      end
    end
    
    output_image(blurred_image)

  end
  
end

pixels = [
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1]
]

image = Image.new(pixels, 3)


image.blur_image
