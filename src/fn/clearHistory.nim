import os

const
  homeDir = getHomeDir()
  bashHistory = joinPath(homeDir, ".bash_history")
  fishHistory = joinPath(homeDir, ".local", "share", "fish", "fish_history")

proc clearBashHistory() =
  if fileExists(bashHistory):
    removeFile(bashHistory)

proc clearFishHistory() =
  if fileExists(fishHistory):
    removeFile(fishHistory)

proc clean*() =
    clearBashHistory()
    clearFishHistory()
