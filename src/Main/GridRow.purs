module Main.GridRow
  ( GridRow(..)
  , firstCell
  , rowWinner
  , secondCell
  , thirdCell
  )
  where

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

-- | First (left) cell of row.
firstCell :: GridRow -> Cell
firstCell (GridRow c _ _) = c

-- | Second (middle) cell of row.
secondCell :: GridRow -> Cell
secondCell (GridRow _ c _) = c

-- | Third (right) cell of row.
thirdCell :: GridRow -> Cell
thirdCell (GridRow _ _ c) = c
