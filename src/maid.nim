import os
import flags/flags
import fn/[cacheClean, cacheThumbnails, currentVersion, clearHistory, clearClipboard]

proc processFlags(params: seq[string]): tuple[history: bool, clipboard: bool, thumbnails: bool, clear: bool, help: bool, version: bool] =
  (flagHistory in params, flagClipboard in params, flagThumbnails in params, flagClear in params, flagHelp in params, flagVersion in params)

proc main() =
  let params: seq[string] = commandLineParams()
  let (history, clipboard, thumbnails, clear, help, version) = processFlags(params)

  if help:
    flags.print()
  if version:
    currentVersion.print()
  if history:
    clearHistory.clean()
  if clipboard:
    clearClipboard.clean()
  if thumbnails:
    cacheThumbnails.clean()
  if clear:
    cacheClean.clean()
    clearHistory.clean()
    clearClipboard.clean()

  if not (clear or history or clipboard or thumbnails or help or version):
    flags.print()

main()
