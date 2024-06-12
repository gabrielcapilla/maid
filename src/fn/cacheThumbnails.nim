import os, strutils

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

proc userResponse(): char =
  while true:
    write(stdout, "Do you want to delete the thumbnail cache (y/n) ")
    flushFile(stdout)
    let response = readLine(stdin)
    if response.len > 0:
      let charResp = response[0].toLowerAscii()
      if charResp in {'s', 'y', 'n'}:
        return charResp
      else:
        echo "Invalid option. Please answer with (y/n)"

proc clean*() =
  if dirExists(cacheDir):
    let response = userResponse()
    if response in {'s', 'y'}:
      for dirName in dirNames:
        removeFiles(joinPath(cacheDir, dirName))
    else:
      echo "The contents of the folders have not been deleted."
  else:
    echo "The folder ", cacheDir, " does not exist."
