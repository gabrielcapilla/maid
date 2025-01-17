import std/os

const
  cacheDir = joinPath(getHomeDir(), ".cache", "thumbnails")
  dirNames = ["large", "normal", "x-large", "xx-large"]

proc cleanThumbnails*() =
  if dirExists(cacheDir):
    for dirName in dirNames:
      let dirPath = joinPath(cacheDir, dirName)
      if dirExists(dirPath):
        for file in walkFiles(dirPath / "*"):
          removeFile(file)
        echo "Thumbnail cache in ", dirPath, " removed."
      else:
        echo "The folder ", dirPath, " does not exist."
  else:
    echo "The folder ", cacheDir, " does not exist."
