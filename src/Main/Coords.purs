module Main.Coords
  ( Coord(..)
  , Coords
  , allCoords
  , modifyAt
  , ofCoord
  )
  where

import Prelude

import Data.List (List(..), (:))
import Data.Three (Three(..), fst, snd, trd)

-- | Coord. Since cube is 3x3x3,
-- | only three coord by each axis possible.
data Coord = Zero | One | Two

-- | Coords of cell in cube (X Y Z order).
type Coords = Three Coord

-- | All possible coords from Coord.
allCoords :: List Coords
allCoords = Three
  <$> Zero : One : Two : Nil
  <*> Zero : One : Two : Nil
  <*> Zero : One : Two : Nil

-- | Elem in Three with given Coord.
ofCoord :: forall a. Coord -> (Three a -> a)
ofCoord Zero = fst
ofCoord One = snd
ofCoord Two = trd

-- | Modify elem of Three in given coord.
modifyAt :: forall a. Coord -> (a -> a) -> Three a -> Three a
modifyAt Zero f = apply (Three f identity identity)
modifyAt One  f = apply (Three identity f identity)
modifyAt Two  f = apply (Three identity identity f)
