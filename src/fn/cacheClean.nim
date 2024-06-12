import os, strutils

const
  homeDir = getHomeDir()
  cacheDir = joinPath(homeDir, ".cache")

proc cleanCacheDir(dir: string) =
  if dirExists(dir):
    for path in walkDir(dir):
      try:
        if path.kind == pcFile:
          removeFile(path.path)
        elif path.kind == pcDir:
          removeDir(path.path)
      except OSError:
        echo "Error deleting ", path.path
    echo "Contents of folder ", dir, " deleted."
  else:
    echo "The folder ", dir, " does not exist."

proc clean*() =
  if dirExists(cacheDir):
    write(stdout, "Do you want to delete the entire contents of the cache (y/n) ")
    flushFile(stdout)
    if readLine(stdin).toLowerAscii() == "s":
      cleanCacheDir(cacheDir)
    else:
      echo "The contents of the folder have not been deleted."
  else:
    echo "The folder ", cacheDir, " does not exist."
