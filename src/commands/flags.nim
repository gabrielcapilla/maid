import std/parseopt

type Flags* = object
  help*: bool
  clear*: bool
  version*: bool
  history*: bool
  clipboard*: bool
  thumbnails*: bool

proc parseFlags*(): Flags =
  var p = initOptParser()
  for kind, key, val in p.getopt():
    case kind
    of cmdArgument:
      discard # Ignorar argumentos posicionales
    of cmdLongOption, cmdShortOption:
      case key
      of "help", "h":
        result.help = true
      of "clear":
        result.clear = true
      of "version", "v":
        result.version = true
      of "history":
        result.history = true
      of "clipboard", "k":
        result.clipboard = true
      of "thumbnails", "t":
        result.thumbnails = true
      else:
        discard # Ignorar opciones desconocidas
    of cmdEnd:
      discard # Fin del análisis

proc printHelp*() =
  echo """
Usage: maid [options]

Options:
  -h, --help       Show this help message
  -v, --version    Show the version of the utility
  --clear          Clear ALL unwanted tracers users leave on the system
  --history        Clear the history of commands (bash & fish)
  -k, --clipboard  Clear the clipboard
  -t, --thumbnails Clear all cached thumbnails
  """
