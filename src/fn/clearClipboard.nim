import osproc

proc clean*() =
  discard execCmd("qdbus org.kde.klipper /klipper org.kde.klipper.klipper.clearClipboardHistory")

