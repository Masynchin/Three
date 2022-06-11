module Main.GridRow where

import Prelude

import Data.Maybe (Maybe(..))
import Main.Cell (Cell, playerCell)
import Main.Player (Player)

-- | Grid row.
data GridRow = GridRow Cell Cell Cell

-- | Winner of row.
rowWinner :: GridRow -> Maybe Player
rowWinner (GridRow c1 c2 c3)
  | (c1 == c2) && (c2 == c3) = playerCell c1
  | otherwise = Nothing
