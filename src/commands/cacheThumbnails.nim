import std/os

const
  HomeDir: string = getHomeDir()
  cacheDir: string = joinPath(HomeDir, ".cache", "thumbnails")
  dirNames: array[0..3, string] = ["large", "normal", "x-large", "xx-large"]

proc cleanThumbnails*() =
  ## Cleans the thumbnail cache by removing all files in the specified subdirectories.

  if dirExists(cacheDir):
    for dirName in dirNames:
      let dirPath = joinPath(cacheDir, dirName)
      if dirExists(dirPath):
        # Remove all files in the subdirectory
        for file in walkFiles(dirPath / "*"):
          try:
            removeFile(file)
          except OSError as e:
            stderr.writeLine("Error deleting ", file, ": ", e.msg)
        stdout.writeLine("Thumbnail cache in ", dirPath, " removed.")
      else:
        stderr.writeLine("The folder ", dirPath, " does not exist.")
  else:
    stderr.writeLine("The folder ", cacheDir, " does not exist.")
