import QtQuick
import Quickshell.Io
import Quickshell

import "../components"
import ".."

PanelWindow {
    exclusionMode: ExclusionMode.Ignore
    aboveWindows: false
    color: "TRANSPARENT"

    anchors {
        top: true
        bottom: true
        left: true
        right: true
    }

    margins {
        top: 0
        bottom: 0
        left: 0
        right: 0
    }

    BarText {
        anchors.centerIn: parent
        text: Time.minutes 
        font.pointSize: 100
    }
}
