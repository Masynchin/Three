module Main.Grid
  ( Grid
  , firstColumn
  , firstDiagonal
  , firstRow
  , grid
  , gridWinner
  , secondColumn
  , secondDiagonal
  , secondRow
  , thirdColumn
  , thirdRow
  )
  where

import Prelude

import Data.Foldable (findMap)
import Data.List (List(..), (:))
import Data.Maybe (Maybe)
import Data.Three (Three(..), fst, snd, trd)
import Main.GridRow (GridRow, firstCell, rowWinner, secondCell, thirdCell)
import Main.Player (Player)

type Grid = Three GridRow

-- | Grid ctor.
grid :: GridRow -> GridRow -> GridRow -> Grid
grid = Three

-- | Grid winner, if there is one.
gridWinner :: Grid -> Maybe Player
gridWinner = findMap rowWinner <<< allRows

-- | All rows of grid: horizontal, vertical, diagonal.
allRows :: Grid -> List GridRow
allRows = flap ( firstRow
               : secondRow
               : thirdRow
               : firstColumn
               : secondColumn
               : thirdColumn
               : firstDiagonal
               : secondDiagonal
               : Nil
               )

-- | First (top) row of grid.
firstRow :: Grid -> GridRow
firstRow = fst

-- | Second (middle) row of grid.
secondRow :: Grid -> GridRow
secondRow = snd

-- | Third (bottom) row of grid.
thirdRow :: Grid -> GridRow
thirdRow = trd

-- | First (left) column of grid.
firstColumn :: Grid -> GridRow
firstColumn = map firstCell

-- | Second (middle) column of grid.
secondColumn :: Grid -> GridRow
secondColumn = map secondCell

-- | Third (right) column of grid.
thirdColumn :: Grid -> GridRow
thirdColumn = map thirdCell

-- | First (primary) diagonal of grid.
firstDiagonal :: Grid -> GridRow
firstDiagonal = apply (Three firstCell secondCell thirdCell)

-- | Second (secondary) diagonal of grid.
secondDiagonal :: Grid -> GridRow
secondDiagonal = apply (Three thirdCell secondCell firstCell)
