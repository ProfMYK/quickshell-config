import Quickshell // for PanelWindow
import Quickshell.Io;
import QtQuick // for Text
import Quickshell.Hyprland

import ".."
import "."

Box {
    property var onClicked

    MouseArea {
        id: buttonArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: onClicked
    }

    color: buttonArea.containsMouse ? Colors.background2 : Colors.background

    Behavior on color {
        ColorAnimation {
            duration: 150
        }
    }
}
