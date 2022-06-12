module Data.Three
  ( Three(..)
  , fst
  , snd
  , trd
  )
  where

import Prelude

data Three a = Three a a a

-- | First of three.
fst :: forall a. Three a -> a
fst (Three x _ _) = x

-- | Second of three.
snd :: forall a. Three a -> a
snd (Three _ x _) = x

-- | Third of three.
trd :: forall a. Three a -> a
trd (Three _ _ x) = x

derive instance eqThree :: Eq a => Eq (Three a)

instance showThree :: Show a => Show (Three a) where
  show (Three x y z) = "(Three " <> show x <> " " <> show y <> " " <> show z <> ")"

instance functorThree :: Functor Three where
  map f (Three x y z) = Three (f x) (f y) (f z)

instance applyThree :: Apply Three where
  apply (Three f g h) (Three x y z) = Three (f x) (g y) (h z)
