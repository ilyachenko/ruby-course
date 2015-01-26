# Реализация detect
def detect array
  newArr = '';
  for arr in array
    if yield(arr)
      newArr = arr
      break
    end
  end
  return newArr
end

c = detect ([-5, 2, -3, 10, 1, -4]) do |arr|
  arr > 0
end

# Реализация detect ? без newArr = '' не хочет работать.
def detect array
  newArr;
  for arr in array
    if yield(arr)
      newArr = arr
      break
    end
  end
  return newArr
end

c = detect ([-5, 2, -3, 10, 1, -4]) do |arr|
  arr > 0
end
