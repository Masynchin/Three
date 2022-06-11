module Main.Player
  ( Player(..)
  )
  where

import Prelude

-- | Player of the game.
data Player = X | O

instance eqPlayer :: Eq Player where
  eq X X = true
  eq O O = true
  eq _ _ = false

instance showPlayer :: Show Player where
  show X = "X"
  show O = "O"
