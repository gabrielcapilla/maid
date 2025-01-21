import std/os

let
  homeDir: string = getHomeDir()
  historyFiles: seq[string] =
    @[
      joinPath(homeDir, ".bash_history"),
      joinPath(homeDir, ".local", "share", "fish", "fish_history"),
    ]

proc clearHistory*() =
  ## Removes shell history files, handling file-specific errors
  for filePath in historyFiles:
    try:
      if fileExists(filePath):
        removeFile(filePath)
      else:
        stderr.writeLine "Warning: File not found - ", filePath
    except OSError as e:
      stderr.writeLine "Error deleting '", filePath, "': ", e.msg
    except IOError as e:
      stderr.writeLine "IO error with '", filePath, "': ", e.msg
