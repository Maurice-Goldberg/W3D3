class Array

    def merge_sort
        return self if length < 2

        middle_idx = length / 2

        left = self[0...middle_idx]
        right = self[middle_idx..-1]

        #what's below continually splits the array up until smaller arrays initially
        #because it's never satisfying the base case at first
        #then eventually after a certain amount of recursive merge_sort calls,
        #all the recursive calls satisfy the base case of having length 1
        #and they're then passed to sorted_left and sorted_right
        sorted_left = left.merge_sort
        sorted_right = right.merge_sort

        merge(sorted_left, sorted_right)
    end


    def merge(sorted_left, sorted_right)
        merged_arr = []

        until sorted_left.empty? || sorted_right.empty?
            case sorted_left.first <=> sorted_right.first
            when 1
                merged_arr << sorted_right.shift
            when 0 || -1
                merged_arr << sorted_left.shift
            end
        end

        merged_arr + sorted_left + sorted_right
    end
end