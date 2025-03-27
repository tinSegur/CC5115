flipMe :: (a -> b -> c) -> (b -> a -> c)
-- flipMe f = \ax bx -> f bx ax
flipMe f = g where g ax bx = f bx ax

selfComp :: (Integral a) => a -> (b -> b) -> (b -> b)
selfComp 1 f = f
selfComp times f = f . selfComp (times - 1) f

add1 :: (Integral a) => a -> a
add1 = (+) 1

curryMe :: ((a, b) -> c) -> (a -> b -> c)
curryMe f = \x y -> f (x, y)

parComp :: (a -> b) -> (c -> d) -> ((a, c) -> (b, d))
parComp f g = \(x, y) -> (f x, g y)

shorten :: [String] -> [String]
shorten = map (take 5)
