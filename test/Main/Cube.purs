module Test.Main.Cube
  ( testCube
  )
  where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Three (Three(..))
import Effect (Effect)
import Main.Cell (Cell(..))
import Main.Coords (Coord(..))
import Main.Cube (cube, cubeCell, cubeWinner)
import Main.Grid (grid)
import Main.GridRow (gridRow)
import Main.Player (Player(..))
import Test.Unit (suite, test)
import Test.Unit.Assert (equal)
import Test.Unit.Main (runTest)

testCube :: Effect Unit
testCube = do
  runTest do    
    suite "Cube" do
      suite "completed" do
        test "when XY grid completed" do
          let e = Empty
              x = Mark X
              c = cube
                (grid
                  (gridRow x x x)
                  (gridRow e e e)
                  (gridRow e e e))
                (grid
                  (gridRow e e e)
                  (gridRow e e e)
                  (gridRow e e e))
                (grid
                  (gridRow e e e)
                  (gridRow e e e)
                  (gridRow e e e))
          equal (cubeWinner c) (Just X)
        test "when XZ grid completed" do
          let e = Empty
              x = Mark X
              c = cube
                (grid
                  (gridRow e x e)
                  (gridRow e e e)
                  (gridRow e e e))
                (grid
                  (gridRow e x e)
                  (gridRow e e e)
                  (gridRow e e e))
                (grid
                  (gridRow e x e)
                  (gridRow e e e)
                  (gridRow e e e))
          equal (cubeWinner c) (Just X)
        test "when YZ grid completed" do
          let e = Empty
              x = Mark X
              c = cube
                (grid
                  (gridRow e e e)
                  (gridRow x e e)
                  (gridRow e e e))
                (grid
                  (gridRow e e e)
                  (gridRow x e e)
                  (gridRow e e e))
                (grid
                  (gridRow e e e)
                  (gridRow x e e)
                  (gridRow e e e))
          equal (cubeWinner c) (Just X)
      suite "not complete" do
        test "when all empty" do
          let e = Empty
              c = cube
                (grid
                  (gridRow e e e)
                  (gridRow e e e)
                  (gridRow e e e))
                (grid
                  (gridRow e e e)
                  (gridRow e e e)
                  (gridRow e e e))
                (grid
                  (gridRow e e e)
                  (gridRow e e e)
                  (gridRow e e e))
          equal (cubeWinner c) Nothing
        test "when one empty" do
          let e = Empty
              x = Mark X
              c = cube
                (grid
                  (gridRow x x e)
                  (gridRow x x e)
                  (gridRow e e e))
                (grid
                  (gridRow x x e)
                  (gridRow x x e)
                  (gridRow e e e))
                (grid
                  (gridRow e e e)
                  (gridRow e e e)
                  (gridRow e e e))
          equal (cubeWinner c) Nothing
        test "when different players" do
          let e = Empty
              x = Mark X
              o = Mark O
              c = cube
                (grid
                  (gridRow x o x)
                  (gridRow x o o)
                  (gridRow o x x))
                (grid
                  (gridRow o x o)
                  (gridRow x x o)
                  (gridRow x o x))
                (grid
                  (gridRow e e e)
                  (gridRow e e e)
                  (gridRow e e e))
          equal (cubeWinner c) Nothing
      suite "has cell" do
        test "in bounds" do
          let e = Empty
              x = Mark X
              o = Mark O
              coordX = Three Zero Zero Zero
              coordO = Three Two Two Two
              c = cube
                (grid
                  (gridRow x e e)
                  (gridRow e e e)
                  (gridRow e e e))
                (grid
                  (gridRow e e e)
                  (gridRow e e e)
                  (gridRow e e e))
                (grid
                  (gridRow e e e)
                  (gridRow e e e)
                  (gridRow e e o))
          equal (cubeCell coordX c) x
          equal (cubeCell coordO c) o
