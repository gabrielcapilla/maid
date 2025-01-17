import std/os

const
  homeDir = getHomeDir()
  bashHistory = joinPath(homeDir, ".bash_history")
  fishHistory = joinPath(homeDir, ".local", "share", "fish", "fish_history")

proc clearHistory*() =
  if fileExists(bashHistory):
    removeFile(bashHistory)
  if fileExists(fishHistory):
    removeFile(fishHistory)
