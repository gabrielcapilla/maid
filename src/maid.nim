import std/os
import flags
import commands/[cacheClean, cacheThumbnails, clearClipboard, clearHistory, version]

proc main() =
  let params = commandLineParams()
  let flags = parseFlags(params)

  if flags.help:
    printHelp()
  elif flags.version:
    printVersion()
  elif flags.clear:
    cleanCache()
    clearHistory()
    clearClipboard()
  else:
    if flags.history:
      clearHistory()
    if flags.clipboard:
      clearClipboard()
    if flags.thumbnails:
      cleanThumbnails()

    if not (flags.history or flags.clipboard or flags.thumbnails or flags.clear):
      printHelp()

when isMainModule:
  main()
