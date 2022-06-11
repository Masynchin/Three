module Main.GridRow
  ( GridRow
  , firstCell
  , gridRow
  , rowWinner
  , secondCell
  , thirdCell
  )
  where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Three (Three(..), fst, snd, trd)
import Main.Cell (Cell, playerCell)
import Main.Player (Player)

-- | Grid row.
type GridRow = Three Cell

-- | Grid row ctor.
gridRow :: Cell -> Cell -> Cell -> GridRow
gridRow = Three

-- | Winner of row.
rowWinner :: GridRow -> Maybe Player
rowWinner (Three c1 c2 c3)
  | (c1 == c2) && (c2 == c3) = playerCell c1
  | otherwise = Nothing

-- | First (left) cell of row.
firstCell :: GridRow -> Cell
firstCell = fst

-- | Second (middle) cell of row.
secondCell :: GridRow -> Cell
secondCell = snd

-- | Third (right) cell of row.
thirdCell :: GridRow -> Cell
thirdCell = trd
