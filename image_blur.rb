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

  def blur_image
    original_image_data = Marshal.dump(@data)
    blurred_image = Marshal.load(original_image_data)

    distance_ranges = (0..@distance).map {|d| Range.new(-d, d)}.reverse

    @data.each_with_index do |outer, outer_index|
      outer.each_with_index do |inner, inner_index|

        if inner == 1
          distance_ranges.each_with_index do |fill_range, r_index|
            fill_range.each do |index_to_blur|
              if !@data[outer_index + r_index].nil?
                if !@data[outer_index + r_index][inner_index + index_to_blur].nil?
                  blurred_image[outer_index + r_index][inner_index + index_to_blur] = 1
                end
              end

              if !@data[outer_index - r_index].nil?
                if !@data[outer_index - r_index][inner_index - index_to_blur].nil?
                  blurred_image[outer_index - r_index][inner_index - index_to_blur] = 1
                end
              
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
