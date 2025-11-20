import Quickshell // for PanelWindow
import Quickshell.Io;
import QtQuick // for Text
import Quickshell.Hyprland

import ".";
import "workspaces"
import "../components"
import "blocks"

PanelWindow {
    id: bar
    anchors {
        top: true
        left: true
        right: true
    }

    margins {
        top: 5
        bottom: 5
        right: 20
        left: 20
    }

    implicitHeight: 40
    color: "TRANSPARENT"

    // aboveWindows: false

    Workspaces {}
    Title {}
    Blocks {}
}

