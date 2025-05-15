type KnightPos = (Int, Int)

moveKnight :: KnightPos -> [KnightPos]
-- moveKnight (i, j) = [(i + 2, j + 1), (i + 1, j + 2), (i - 2, j + 1), (i - 1, j + 2), (i + 2, j - 1), (i + 1, j - 2), (i - 2, j - 1), (i - 1, j - 2)]
moveKnight (i, j) = filter onBoard positions
  where
    positions = do
      v1 <- [1, -1]
      v2 <- [2, -2]
      [(i + v1, j + v2), (i + v2, j + v1)]

    onBoard (x, y) = x `elem` [1 .. 8] && y `elem` [1 .. 8]

movesIn3 :: KnightPos -> [KnightPos]
movesIn3 start = do
  x1 <- moveKnight start
  x2 <- moveKnight x1
  moveKnight x2

canReachIn3Moves :: KnightPos -> KnightPos -> Bool
canReachIn3Moves start end = end `elem` movesIn3
  where
    movesIn3 = moveKnight start >>= moveKnight >>= moveKnight
