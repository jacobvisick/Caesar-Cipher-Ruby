def bubble_sort(array)
    sorting = false 

    array.each_with_index do |value, index|
        break if index == array.length - 1

        nextValue = array[index + 1]

        if value > nextValue then
            sorting = true
            array[index] = nextValue
            array[index + 1] = value
        end
    end
    
    array = bubble_sort(array) if sorting
    array
end

data = [4,3,78,2,0,2]
p bubble_sort(data)
# => [0,2,2,3,4,78]