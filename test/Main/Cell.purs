module Test.Main.Cell where

import Prelude

import Effect (Effect)
import Main.Cell (Cell(..), markCell)
import Main.Player (Player(..))
import Test.Unit (suite, test)
import Test.Unit.Assert (equal)
import Test.Unit.Main (runTest)

testCell :: Effect Unit
testCell = do
  runTest do    
    suite "Cell" do
      suite "marks player" do
        test "when empty" do
          equal (markCell X Empty) (Mark X)
      suite "not marks player" do
        test "when already marked" do
          equal (markCell X (Mark O)) (Mark O)
