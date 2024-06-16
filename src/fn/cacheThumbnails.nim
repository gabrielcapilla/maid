import os

const
  homeDir: string = getHomeDir()
  cacheDir: string = joinPath(homeDir, ".cache", "thumbnails")
  dirNames: array[4, string] = ["large", "normal", "x-large", "xx-large"]

proc removeFiles(dir: string) =
  if dirExists(dir):
    for file in walkFiles(dir / "*"):
      removeFile(file)
    echo "Thumbnail cache in ", dir, " removed."
  else:
    echo "The folder ", dir, " does not exist."

proc clean*() =
  if dirExists(cacheDir):
      for dirName in dirNames:
        removeFiles(joinPath(cacheDir, dirName))
  else:
    echo "The folder ", cacheDir, " does not exist."
