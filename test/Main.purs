module Test.Main where

import Prelude

import Effect (Effect)
import Test.Main.Cell (testCell)
import Test.Main.Cube (testCube)
import Test.Main.Grid (testGrid)
import Test.Main.GridRow (testGridRow)

main :: Effect Unit
main = do
  testCell
  testGridRow
  testGrid
  testCube
