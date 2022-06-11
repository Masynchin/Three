{ name = "three"
, dependencies = [ "console", "effect", "maybe", "prelude", "test-unit" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
