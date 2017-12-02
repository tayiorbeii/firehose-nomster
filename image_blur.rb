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

    distance_ranges = (0..@distance).map {|d| Range.new(-d, d)}.reverse

    @data.each_with_index do |outer, outer_index|
      outer.each_with_index do |inner, inner_index|

        if inner == 1
          ups_to_do = @distance
          downs_to_do = @distance
          rights_to_do = @distance
          lefts_to_do = @distance

          # blur_up(blurred_image, outer_index, inner_index, @distance)


          # Horizontal (working)
          # (-@distance..@distance).each do |index_to_blur|
          #   puts "[#{outer_index}][#{inner_index + index_to_blur}]"
          #   if !blurred_image[outer_index][inner_index + index_to_blur].nil?
          #     blurred_image[outer_index][inner_index + index_to_blur] = 1
          #   end
          # end

          # ranges
          distance_ranges.each_with_index do |fill_range, r_index|
            # Iterate each of our possible ranges
            fill_range.each do |index_to_blur|
              if !original_image_data.at(outer_index + r_index).nil?
                puts "[#{outer_index + r_index}][#{inner_index + index_to_blur}]"
                if !original_image_data[outer_index + r_index][inner_index + index_to_blur].nil?
                  blurred_image[outer_index + r_index][inner_index + index_to_blur] = 1
                end
              end
            end
            puts '****'
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
