import Quickshell
import QtQuick
import Quickshell.Hyprland

import "../../components"
import "../.."

Box {
    height: 30
    width: 30

    property HyprlandWorkspace workspace
    color: getBackgroundColor(workspace.focused, mouseArea.containsMouse) 

    function getName(name) {
        switch (name) {
            case "1": return "";
            case "2": return "󰖟";
            case "3": return "";
            case "4": return "";
            case "5": return "󰽉";
            default: return name;
        }
    }

    function getBackgroundColor(focused, hovering) {
        if (focused) {
            return Colors.border;
        }

        return Colors.background;
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }

    BarText {
        text: getName(workspace.name)
    }

    Behavior on color {
        ColorAnimation {
            duration: 150
        }
    }
}
