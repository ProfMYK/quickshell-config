import QtQuick
import Quickshell.Io
import Quickshell

import "../components"
import ".."

BarText {
    anchors.centerIn: undefined
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 20
    color: Colors.border

    property string splashText

    Process {
        id: titleProc
        command: ["sh", "-c", "hyprctl splash"]
        running: true

        stdout: SplitParser {
            onRead: data => splashText = data
        }
    }

    text: splashText
}
