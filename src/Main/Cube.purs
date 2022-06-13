module Main.Cube
  ( allGrids
  , cube
  , cubeCell
  , cubeWinner
  , markCubeCell
  )
  where

import Prelude

import Data.Foldable (findMap)
import Data.List (List(..), (:))
import Data.Maybe (Maybe)
import Data.Three (Three(..), fst, snd, trd)
import Main.Cell (Cell)
import Main.Coords (Coord, Coords, modifyAt, ofCoord)
import Main.Grid (Grid, firstColumn, firstDiagonal, firstRow, gridWinner, markGridCell, secondColumn, secondDiagonal, secondRow, thirdColumn, thirdRow)
import Main.Player (Player)

type Cube = Three Grid

-- | Cube ctor.
cube :: Grid -> Grid -> Grid -> Cube
cube = Three

-- | Cube winner, if there is one.
cubeWinner :: Cube -> Maybe Player
cubeWinner = findMap gridWinner <<< allGrids

-- | All grid of cube: horizontal, vertical, diagonal.
allGrids :: Cube -> List Grid
allGrids = flap ( firstGridXY
                : secondGridXY
                : thirdGridXY
                : firstGridXZ
                : secondGridXZ
                : thirdGridXZ
                : firstGridYZ
                : secondGridYZ
                : thirdGridYZ
                : firstDiagonalGrid
                : secondDiagonalGrid
                : Nil
                )

-- | First (top) XY grid of cube.
firstGridXY :: Cube -> Grid
firstGridXY = fst

-- | Second (middle) XY grid of cube.
secondGridXY :: Cube -> Grid
secondGridXY = snd

-- | Third (bottom) XY grid of cube.
thirdGridXY :: Cube -> Grid
thirdGridXY = trd

-- | First (front) XZ grid of cube.
firstGridXZ :: Cube -> Grid
firstGridXZ = map firstRow

-- | Second (middle) XZ grid of cube.
secondGridXZ :: Cube -> Grid
secondGridXZ = map secondRow

-- | Third (back) XZ grid of cube.
thirdGridXZ :: Cube -> Grid
thirdGridXZ = map thirdRow

-- | First (front) YZ grid of cube.
firstGridYZ :: Cube -> Grid
firstGridYZ = map firstColumn

-- | Second (middle) YZ grid of cube.
secondGridYZ :: Cube -> Grid
secondGridYZ = map secondColumn

-- | Third (back) YZ grid of cube.
thirdGridYZ :: Cube -> Grid
thirdGridYZ = map thirdColumn

-- | First (primary) diagonal grid of cube.
firstDiagonalGrid :: Cube -> Grid
firstDiagonalGrid = map firstDiagonal

-- | Second (secondary) diagonal grid of cube.
secondDiagonalGrid :: Cube -> Grid
secondDiagonalGrid = map secondDiagonal

-- | Cube cell with given coords.
cubeCell :: Coords -> Cube -> Cell
cubeCell (Three x y z) = (ofCoord x) <<< (ofCoord y) <<< (ofCoord z)

-- | Mark cell in cube with player.
markCubeCell :: Coord -> Coord -> Coord -> Player -> Cube -> Cube
markCubeCell z y x player = modifyAt z (markGridCell y x player)
