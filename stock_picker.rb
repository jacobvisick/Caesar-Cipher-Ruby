=begin
    
    Implement a method #stock_picker that takes in an array of stock prices, 
    one for each hypothetical day. It should return a pair of days representing
    the best day to buy and the best day to sell. Days start at 0.

    > stock_picker([17,3,6,9,15,8,6,1,10])
    => [1,4]  # for a profit of $15 - $3 == $12

    Quick Tips:

    You need to buy before you can sell
    Pay attention to edge cases like when the lowest day is the last day or
    the highest day is the first day.

=end

def stock_picker(price_history)
    result = []
    profit = 0

    price_history.each_with_index do |price, index|
        x = 0
        while x < index do
            if price - price_history[x] > profit then
                profit = price - price_history[x]
                buy_index = x
                result = [x, index]
            end
            x += 1
        end
    end

    result
end

data = [17,3,6,9,15,8,6,1,10]
p stock_picker(data)
#=> [1, 4]