{ name = "three"
, dependencies =
  [ "console"
  , "effect"
  , "foldable-traversable"
  , "lists"
  , "maybe"
  , "prelude"
  , "test-unit"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
