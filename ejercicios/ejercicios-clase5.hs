data Day = Lunes | Martes | Miercoles | Jueves | Viernes | Sabado | Domingo deriving (Show, Eq, Ord)

weekDay :: Day -> Bool
{-
weekDay Sabado = False
weekDay Domingo = False
weekDay _ = True
-}

weekDay d = d < Sabado

data Nat = Zero | Succ Nat deriving (Show, Eq)

nat2Int :: Nat -> Int
nat2Int Zero = 0
nat2Int (Succ n) = 1 + nat2Int n

int2Nat :: Int -> Nat
int2Nat 0 = Zero
int2Nat n = Succ (int2Nat (n - 1))

addNat :: Nat -> Nat -> Nat
addNat Zero n = n
addNat (Succ m) n = Succ (addNat m n)

data BinTree a
  = Leaf a
  | InNode (BinTree a) a (BinTree a)
  deriving (Eq, Show)

flatten :: BinTree a -> [a]
flatten (Leaf x) = [x]
flatten (InNode a v b) = flatten a ++ [v] ++ flatten b

mirror :: BinTree a -> BinTree a
mirror (Leaf a) = Leaf a
mirror (InNode a v b) = InNode (mirror b) v (mirror a)

data Tree a = NNode [Tree a] a deriving (Show, Eq)

size :: Tree a -> Int
size (NNode [] _) = 1
size (NNode lst _) = 1 + sum (map size lst)

foldT :: ([b] -> a -> b) -> Tree a -> b
foldT f (NNode lst x) = f (map (foldT f) lst) x

newsize :: Tree a -> Int
newsize = foldT (\xs _ -> sum xs + 1)

main = print (newsize (NNode [NNode [] 1, NNode [] 2, NNode [] 3] 4))
