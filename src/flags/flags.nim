const
  flagHelp*: string =       "--help"
  flagClear*: string =      "--clear"
  flagVersion*: string =    "--version"
  flagHistory*: string =    "-h"
  flagClipboard*: string =  "-k"
  flagThumbnails*: string = "-t"

proc print*() =
  echo "Usage: maid [command] \n\n ", flagClipboard, " \t| Clears the clipboard\n ", flagThumbnails, " \t| Clears all cached thumbnails\n ", flagHistory, " \t| Clear the history of commands (bash & fish)\n\n ", flagHelp, " \t| Displays available commands\n ", flagVersion, " \t| Show the version of the utility\n ", flagClear, " \t| Clear ALL unwanted tracers users leave on the system"
