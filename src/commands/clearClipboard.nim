import std/osproc

proc clearClipboard*() =
  discard execCmd(
    "qdbus org.kde.klipper /klipper org.kde.klipper.klipper.clearClipboardHistory"
  )
