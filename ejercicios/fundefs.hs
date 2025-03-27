implies :: Bool -> Bool -> Bool 
implies True False = False
implies _ _ = True

reverseMe :: [a] -> [a]
reverseMe lst = reverseUtil lst []
    where
        reverseUtil [] acc = acc
        reverseUtil (x:xs) acc = reverseUtil xs (x:acc)