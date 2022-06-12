module Test.Main.GridRow
  ( testGridRow
  )
  where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Main.Cell (Cell(..))
import Main.Coords (Coord(..))
import Main.GridRow (gridRow, markRowCell, rowWinner)
import Main.Player (Player(..))
import Test.Unit (suite, test)
import Test.Unit.Assert (equal)
import Test.Unit.Main (runTest)

testGridRow :: Effect Unit
testGridRow = do
  runTest do    
    suite "Grid row" do
      suite "completed" do
        test "when all cells from one player" do
          let rowX = gridRow (Mark X) (Mark X) (Mark X)
              rowO = gridRow (Mark O) (Mark O) (Mark O)
          equal (rowWinner rowX) (Just X)
          equal (rowWinner rowO) (Just O)
      suite "not completed" do
        test "when all empty" do
          let row = gridRow Empty Empty Empty
          equal (rowWinner row) Nothing
        test "when one empty" do
          let row1 = gridRow Empty (Mark X) (Mark X)
              row2 = gridRow Empty (Mark X) (Mark X)
              row3 = gridRow Empty (Mark X) (Mark X)
          equal (rowWinner row1) Nothing
          equal (rowWinner row2) Nothing
          equal (rowWinner row3) Nothing
        test "when different players" do
          let row = gridRow (Mark X) (Mark O) (Mark X)
          equal (rowWinner row) Nothing
      suite "marks cell" do
        test "when empty" do
          let row = gridRow Empty Empty Empty
              updated = gridRow (Mark X) Empty Empty
          equal (markRowCell Zero X row) updated
      suite "not marks cell" do
        test "when already marked" do
          let row = gridRow (Mark X) (Mark X) (Mark X)
          equal (markRowCell Zero O row) row
