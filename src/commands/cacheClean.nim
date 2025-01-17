import std/[os, strutils]

const cacheDir = joinPath(getHomeDir(), ".cache")

proc cleanCache*() =
  if dirExists(cacheDir):
    write(stdout, "Do you want to delete the entire contents of the cache? (y/n) ")
    flushFile(stdout)
    if readLine(stdin).toLowerAscii() == "y":
      for path in walkDir(cacheDir):
        try:
          if path.kind == pcFile:
            removeFile(path.path)
          elif path.kind == pcDir:
            removeDir(path.path)
        except OSError:
          echo "Error deleting ", path.path
      echo "Contents of folder ", cacheDir, " deleted."
    else:
      echo "The contents of the folder have not been deleted."
  else:
    echo "The folder ", cacheDir, " does not exist."
