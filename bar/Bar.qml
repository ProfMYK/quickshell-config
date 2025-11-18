import Quickshell // for PanelWindow
import Quickshell.Io;
import QtQuick // for Text
import Quickshell.Hyprland

import ".";
import "workspaces"

PanelWindow {
    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 40
    color: "TRANSPARENT"

    Workspaces {}
    Title {}
}

