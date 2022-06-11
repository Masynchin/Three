module Test.Main.Grid
  ( testGrid
  )
  where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Main.Cell (Cell(..))
import Main.Grid (Grid(..), gridWinner)
import Main.GridRow (GridRow(..))
import Main.Player (Player(..))
import Test.Unit (suite, test)
import Test.Unit.Assert (equal)
import Test.Unit.Main (runTest)

testGrid :: Effect Unit
testGrid = do
  runTest do    
    suite "Grid" do
      suite "completed" do
        test "when horizontal row completed" do
          let e = Empty
              x = Mark X
              grid = Grid
                (GridRow x x x)
                (GridRow e e e)
                (GridRow e e e)
          equal (gridWinner grid) (Just X)
        test "when vertical row completed" do
          let e = Empty
              x = Mark X
              grid = Grid
                (GridRow x e e)
                (GridRow x e e)
                (GridRow x e e)
          equal (gridWinner grid) (Just X)
        test "when diagonal row completed" do
          let e = Empty
              x = Mark X
              grid = Grid
                (GridRow x e e)
                (GridRow e x e)
                (GridRow e e x)
          equal (gridWinner grid) (Just X)
      suite "not complete" do
        test "when all empty" do
          let e = Empty
              grid = Grid
                (GridRow e e e)
                (GridRow e e e)
                (GridRow e e e)
          equal (gridWinner grid) Nothing
        test "when one empty" do
          let e = Empty
              x = Mark X
              grid = Grid
                (GridRow x x e)
                (GridRow x x e)
                (GridRow e e e)
          equal (gridWinner grid) Nothing
        test "when different players" do
          let x = Mark X
              o = Mark O
              grid = Grid
                (GridRow x o x)
                (GridRow x o o)
                (GridRow o x x)
          equal (gridWinner grid) Nothing
