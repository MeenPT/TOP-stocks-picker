def stock_picker(stock_prices = [])
  price_diff = 0
  low_price = nil
  high_price = nil

  stock_prices.each_with_index do |price, index|
    remain_prices = stock_prices.slice((index + 1)...-1)

    break if remain_prices.empty?

    if remain_prices.max - price > price_diff
      low_price = price
      high_price = remain_prices.max
      price_diff = remain_prices.max - price
    end
  end

  low_price_index = stock_prices.index(low_price)
  high_price_index = stock_prices.reverse.index(high_price)

  return [low_price_index, high_price_index]
end

p stock_picker([17,3,6,9,15,8,6,1,10])