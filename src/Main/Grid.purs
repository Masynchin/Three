module Main.Grid
  ( Grid(..)
  , gridWinner
  )
  where

import Prelude

import Data.Foldable (findMap)
import Data.List (List(..), (:))
import Data.Maybe (Maybe)
import Main.GridRow (GridRow(..), firstCell, rowWinner, secondCell, thirdCell)
import Main.Player (Player)

data Grid = Grid GridRow GridRow GridRow

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
firstRow (Grid r _ _) = r

-- | Second (middle) row of grid.
secondRow :: Grid -> GridRow
secondRow (Grid _ r _) = r

-- | Third (bottom) row of grid.
thirdRow :: Grid -> GridRow
thirdRow (Grid _ _ r) = r

-- | First (left) column of grid.
firstColumn :: Grid -> GridRow
firstColumn (Grid r1 r2 r3) = GridRow (firstCell r1) (firstCell r2) (firstCell r3)

-- | Second (middle) column of grid.
secondColumn :: Grid -> GridRow
secondColumn (Grid r1 r2 r3) = GridRow (secondCell r1) (secondCell r2) (secondCell r3)

-- | Third (right) column of grid.
thirdColumn :: Grid -> GridRow
thirdColumn (Grid r1 r2 r3) = GridRow (thirdCell r1) (thirdCell r2) (thirdCell r3)

-- | First (primary) diagonal of grid.
firstDiagonal :: Grid -> GridRow
firstDiagonal (Grid r1 r2 r3) = GridRow (firstCell r1) (secondCell r2) (thirdCell r3)

-- | Second (secondary) diagonal of grid.
secondDiagonal :: Grid -> GridRow
secondDiagonal (Grid r1 r2 r3) = GridRow (thirdCell r1) (secondCell r2) (firstCell r3)
