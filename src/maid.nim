import os
import flags/flags
import fn/cacheClean
import fn/cacheThumbnails
import fn/currentVersion

proc processFlags(params: seq[string]): tuple[cache: bool, thumbnails: bool, help: bool, version: bool] =
  (flagCache in params, flagThumbnails in params, flagHelp in params, flagVersion in params)

proc main() =
  let params: seq[string] = commandLineParams()
  let (cache, thumbnails, help, version) = processFlags(params)

  if help:
    flags.print()
  if version:
    currentVersion.print()
  if cache:
    cacheClean.clean()
  if thumbnails:
    cacheThumbnails.clean()

  if not (cache or thumbnails or help or version):
    flags.print()

main()
