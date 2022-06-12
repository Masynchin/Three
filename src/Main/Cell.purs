module Main.Cell
  ( Cell(..)
  , markCell
  , playerCell
  )
  where

import Prelude

import Data.Maybe (Maybe(..))
import Main.Player (Player)

-- | Grid cell.
data Cell = Empty | Mark Player

instance eqCell :: Eq Cell where
  eq Empty Empty = true
  eq (Mark p1) (Mark p2) = p1 == p2
  eq _ _ = false

instance showCell :: Show Cell where
  show Empty = "."
  show (Mark p) = show p

-- | Player mark of cell if marked.
playerCell :: Cell -> Maybe Player
playerCell (Mark p) = Just p
playerCell _ = Nothing

-- | Mark cell with player.
markCell :: Player -> Cell -> Cell
markCell _ c@(Mark _) = c
markCell p Empty = Mark p
