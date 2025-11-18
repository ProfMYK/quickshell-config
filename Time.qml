pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root
  // an expression can be broken across multiple lines using {}
  readonly property string fullTime: {
    Qt.formatDateTime(clock.date, "ddd MMM d hh:mm:ss AP t yyyy")
  }

  readonly property string minutes: {
    Qt.formatDateTime(clock.date, "hh:mm")
  }

  readonly property string fancyTime: {
    Qt.formatDateTime(clock.date, "ddd | hh:mm:ss | MMM d | yyyy")
  }

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
}
