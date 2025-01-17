type Flags* = object
  help*: bool
  clear*: bool
  version*: bool
  history*: bool
  clipboard*: bool
  thumbnails*: bool

const
  flagHelp* = "--help"
  flagClear* = "--clear"
  flagVersion* = "--version"
  flagHistory* = "-h"
  flagClipboard* = "-k"
  flagThumbnails* = "-t"

proc parseFlags*(params: seq[string]): Flags =
  result.help = flagHelp in params
  result.clear = flagClear in params
  result.version = flagVersion in params
  result.history = flagHistory in params
  result.clipboard = flagClipboard in params
  result.thumbnails = flagThumbnails in params

proc printHelp*() =
  echo """
Usage: maid [command]

Commands:
  -k       | Clears the clipboard
  -t       | Clears all cached thumbnails
  -h       | Clear the history of commands (bash & fish)

Options:
  --help    | Displays available commands
  --version | Show the version of the utility
  --clear   | Clear ALL unwanted tracers users leave on the system
  """
