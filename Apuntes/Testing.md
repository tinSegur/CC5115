
Para la tarea 1, se utilizará testing por propiedades, una metodología de _testing_ orientada a garantizar que se cumplan propiedades sobre una cierta función. Esto es más robusto que el testing por casos, donde sólo se prueban inputs y outputs específicos. Se denomina _property based testing_.

## QuickCheck

```haskell
-- Testing tradicional

testQsort :: Spec
testQsort = describe "qsort function:" $ do
	it "qsort [2,4,3,1] = [1,2,3,4]" $
		qsort [2,3,4,1] `shouldBe` [1,2,3,4]
	it "qsort [] = []" $
		qsort ([]::[Int]) `ShouldBe` []

```

```haskell
-- Property based testing
testQsort :: Spec
testQsort = describe "qsort function:" $ do
	it "sorting is idempotent" $
		property $\ xs -> qsort (qsort xs::[Int]) == qsort xs 
	it "reversing does not affect sorting result" $
		property $ \xs -> qsort(reverse xs :: [Int]) == qsort xs
```

Esencialmente, al hacer property based testing, se debe definir como lambda una cierta propiedad que se debe cumplir dado un cierto input. 