import Lake
open Lake DSL

/-! # `LPVerify` build configuration

  Pure-Lean LP certificate checker. No native dependencies, no
  `moreLinkArgs`. Built on top of `kim-em/lp-core` (`LPCore.Types`
  and `LPCore.Validate`).

  This is the package that fulfils the verifier-only goal of
  issue #50: any consumer that just wants to verify an
  externally-produced certificate can depend on `lp-verify` (which
  pulls in `lp-core`) without ever touching the SoPlex C++ build.
-/

require LPCore from git "https://github.com/kim-em/lp-core" @
  "60fca2313ea3be14f578258dc6390f2fa07b26e7"

package LPVerify

@[default_target]
lean_lib LPVerify where
  roots := #[`LPVerify]
  globs := #[`LPVerify, `LPVerify.Arith, `LPVerify.Bool, `LPVerify.Budget,
             `LPVerify.Driver, `LPVerify.Prop, `LPVerify.Sound]
