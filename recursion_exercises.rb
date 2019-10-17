require "byebug"

# RECURSIVE
def range(start_num, end_num)
    #base case
    return [] if end_num < start_num
    return [end_num] if start_num == end_num
    
    #inductive step
    [start_num] + range(start_num+1, end_num)
end

# ITERATIVE
def range(start_num, end_num)
    range_arr = []
    i = start_num
    while i < end_num
        range_arr << i
        i += 1
    end
    range_arr
end

def exp1(b, n)
    if n < 0
        1.0/(b * exp1(b, (-1 * n) - 1))
    elsif n == 0
        return 1
    else 
        b * exp1(b, n - 1)
    end
end

def exp2(b, n)
    return 1 if n == 0
    return b if n == 1
    if n.even? 
        val = exp2(b, n/2) 
        val * val
    else
        val = exp2(b, (n-1)/2) 
        b * val * val
    end
end

class Array
    
    def deep_dup
        new_array = []
        self.each do |ele|
            ele.is_a?(Array) ? new_array << ele.deep_dup : new_array << ele
        end
        new_array
    end
    
end

def recursive_fibs(n)
    return [0,1].take(n) if n <= 2

    prev_fibs = recursive_fibs(n-1)
    next_fib_num = prev_fibs[-1] + prev_fibs[-2]
    prev_fibs << next_fib_num
end

def iterative_fibs(n)
    fib_array = [0,1]
    while fib_array.length < n
        fib_array << (fib_array[-1] + fib_array[-2])
    end
    fib_array
end

def bsearch(arr, target)
    mid_val = arr[arr.length / 2]
    if mid_val == nil
        nil
    elsif mid_val == target
        (arr.length / 2)
    elsif mid_val < target
        sub_search = bsearch(arr[(1 + arr.length/2)..-1], target)
        sub_search ? arr.length/2 + 1 + sub_search : nil
    elsif mid_val > target
        bsearch(arr[0...arr.length/2], target)
    end
end

# BSEARCH TEST CASES

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

# def merge_sort(arr)
#     if arr.all? { |el| el.is_a?(Integer) }
#         new_array = arr.map { |ele| new_array << Array.new(1, ele) }
#         merge_sort(new_array)
#     else
#         i = 0
#         container = []
#         while i < arr.length
#             if arr[i+1] == nil
#                 container + merge(arr[i], [])
#             else
#                 container + merge(arr[i], arr[i+1])
#             end
#             i += 2
#         end

#         unless container.length == 1
#             merge_sort(container)
#         else
#             return container[0]
#         end
#     end
# end


# def merge(arr1, arr2)
#     if arr1.length == 1 && arr2.length == 0
#         arr1
#     elsif arr1.length == 0 && arr2.length == 1
#         arr2
#     elsif arr1[0] < arr2[0] 
#         arr1.take(1) + merge(arr1[1..-1], arr2)
#     elsif arr1[0] > arr2[0] 
#         arr2.take(1) + merge(arr1, arr2[1..-1])
#     end
# end

# p merge_sort([38, 27, 43, 3, 9, 82, 10])

#[1]
def subsets(arr)
    # debugger
    return [] if arr.length == 0
    
    subs = []
    subs << arr.dup
    arr_dup = arr.dup

    arr.each { |ele| 
        arr_dup.delete(ele)
        subs + subsets(arr_dup)
        arr_dup = arr.dup
    }
    subs
end

#start wit hempty arr
#iteraete through  what you have saved so far in subs
#add the ele your up to currently to all the elements that are in your saved array
#

p subsets([]) # => [[]]                      =====> [base]
p subsets([1]) # => [[], [1]]                =====> [[]] + [[1]]
                                                    #arr = [1]
                                                    #return [self] if arr.length == 1
def subsets(arr)
    return [self] if arr.length == 1

    subs + subsets()
end


p subsets([1, 2]) # => [[], [1], [2], [1, 2]] =======> [[], [1]] + [[2], [1,2]]

#subs + [[1,2]]
p subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

    # subs = [arr.dup]
    # subs << arr.pop
    # subs << subsets(arr)

    # return [] if arr.empty?
    # return arr if arr.length == 1
    # subs = [arr.dup]
    # arr_dup = arr.dup

    # #[1, 2, 3]
    # #subsets([2,3])
    #     #subs = [2] + subsets ([3])
    #         #subsets([3])
    #             #subs = [2] + []

                
    # arr.each { |ele|
    #     subs << [ele]
    #     subs << subsets(arr_dup.delete(ele))
    #     arr_dup = arr.dup
    # }
    # subs