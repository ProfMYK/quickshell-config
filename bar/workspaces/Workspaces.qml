import Quickshell
import QtQuick.Layouts
import QtQuick
import Quickshell.Hyprland

import "."

RowLayout {
    anchors.verticalCenter: parent.verticalCenter
    anchors.left: parent.left
    anchors.leftMargin: 20
    property var workspaces: Hyprland.workspaces

    spacing: 7

    Repeater {
        model: workspaces

        delegate: Workspace {
            workspace: modelData
        }
    }
}
