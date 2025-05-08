{--
p1 y = "Hello, John Dow"
p2 n
p3 y = "Hello, John Dow"
p4 n
p5 y = Nothing
p6 n
p7 n

--}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

data Expr = Val Int | Add Expr Expr | Div Expr Expr

safediv :: Int -> Int -> Maybe Int
safediv _ 0 = Nothing
safediv x y = Just (x `div` y)

eval :: Expr -> Maybe Int
eval (Val v) = return v
{--
eval (Add e1 e2) =
eval e1 >>= \x1 ->
eval e2 >>= \x2 ->
return (x1 + x2)
eval (Div e1 e2) =
eval e1 >>= \x1 ->
eval e2 >>= \x2 ->
safediv x1 x2
--}
eval (Add e1 e2) = do
  x1 <- eval e1
  x2 <- eval e2
  return (x1 + x2)
eval (Div e1 e2) = do
  x1 <- eval e1
  x2 <- eval e2
  safediv x1 x2

(<=<) :: (Monad m) => (b -> m c) -> (a -> m b) -> (a -> m c)
f <=< g = \x -> do
  i <- g x
  f i
