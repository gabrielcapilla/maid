import std/[os, strutils]

# Define the cache directory path
const
  HomeDir: string = getHomeDir()
  CacheDir: string = joinPath(HomeDir, ".cache")

proc cleanCache*() =
  ## Cleans the cache directory by removing all files and subdirectories.

  if dirExists(CacheDir):
    # Prompt the user for confirmation
    stdout.writeLine("Do you want to delete the entire contents of the cache? (y/n)")
    let userInput: string = readLine(stdin).toLowerAscii()

    if userInput == "y":
      # Iterate over all items in the cache directory

      for path in walkDir(CacheDir):
        try:
          case path.kind
          of pcFile:
            removeFile(path.path)
          of pcDir:
            removeDir(path.path)
          else:
            discard
        except OSError as e:
          stderr.writeLine("Error deleting ", path.path, ": ", e.msg)

      stdout.writeLine("Contents of folder ", CacheDir, " deleted.")
    else:
      stdout.writeLine("The contents of the folder have not been deleted.")
  else:
    stderr.writeLine("The folder ", CacheDir, " does not exist.")
