import Quickshell // for PanelWindow
import Quickshell.Io;
import QtQuick // for Text
import Quickshell.Hyprland

import ".."

Rectangle {
    height: 30
    width: 30
    color: Colors.background
    border.width: 2
    border.color: Colors.border

    Behavior on implicitWidth {
        NumberAnimation {
            duration: 150
            easing.type: Easing.InOutCubic
        }
    }

    Behavior on width {
        NumberAnimation {
            duration: 150
            easing.type: Easing.InOutCubic
        }
    }

    Behavior on implicitHeight {
        NumberAnimation {
            duration: 150
            easing.type: Easing.InOutCubic
        }
    }

    Behavior on height {
        NumberAnimation {
            duration: 150
            easing.type: Easing.InOutCubic
        }
    }
}
