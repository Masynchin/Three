module Main.Player
  ( Player(..)
  )
  where

import Prelude

-- | Player of the game.
data Player = X | O

derive instance eqPlayer :: Eq Player

instance showPlayer :: Show Player where
  show X = "X"
  show O = "O"
