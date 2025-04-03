addAcc :: a -> Int -> Int
addAcc _ acc = acc + 1

length :: [a] -> Int
length = foldr addAcc 0

-- v = 0
-- @ = (+)
-- f = addAcc

-- 0 + x = x
-- addAcc x (y + z) = addAcc x y + z
-- (y + z) + 1 = (y + 1) + z = y + z + 1

-- foldr addAcc 0 (xs ++ ys)    = foldr addAcc 0 xs + fold addAcc 0 ys
-- length (xs ++ ys)            = length xs + length ys
