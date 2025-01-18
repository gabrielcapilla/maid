import std/os

const
  homeDir: string = getHomeDir()
  bashHistory: string = joinPath(homeDir, ".bash_history")
  fishHistory: string = joinPath(homeDir, ".local", "share", "fish", "fish_history")

proc clearHistory*() =
  ## Clear the history
  if fileExists(bashHistory):
    removeFile(bashHistory)
  if fileExists(fishHistory):
    removeFile(fishHistory)
