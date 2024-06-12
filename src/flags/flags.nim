const
  flagHelp*: string =       "--help"
  flagCache*: string =      "--cache"
  flagVersion*: string =    "--version"
  flagThumbnails*: string = "--thumbnails"

proc print*() =
  echo "Usage: maid [", flagCache, "] [", flagThumbnails, "] [", flagHelp, "] [", flagVersion, "]"
