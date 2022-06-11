module Test.Main.Grid
  ( testGrid
  )
  where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Main.Cell (Cell(..))
import Main.Grid (grid, gridWinner)
import Main.GridRow (gridRow)
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
              g = grid
                (gridRow x x x)
                (gridRow e e e)
                (gridRow e e e)
          equal (gridWinner g) (Just X)
        test "when vertical row completed" do
          let e = Empty
              x = Mark X
              g = grid
                (gridRow x e e)
                (gridRow x e e)
                (gridRow x e e)
          equal (gridWinner g) (Just X)
        test "when diagonal row completed" do
          let e = Empty
              x = Mark X
              g = grid
                (gridRow x e e)
                (gridRow e x e)
                (gridRow e e x)
          equal (gridWinner g) (Just X)
      suite "not complete" do
        test "when all empty" do
          let e = Empty
              g = grid
                (gridRow e e e)
                (gridRow e e e)
                (gridRow e e e)
          equal (gridWinner g) Nothing
        test "when one empty" do
          let e = Empty
              x = Mark X
              g = grid
                (gridRow x x e)
                (gridRow x x e)
                (gridRow e e e)
          equal (gridWinner g) Nothing
        test "when different players" do
          let x = Mark X
              o = Mark O
              g = grid
                (gridRow x o x)
                (gridRow x o o)
                (gridRow o x x)
          equal (gridWinner g) Nothing
