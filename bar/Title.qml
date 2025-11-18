import Quickshell // for PanelWindow
import Quickshell.Io;
import QtQuick // for Text
import Quickshell.Hyprland

import "../Theme.qml" as Theme

Text {
    property string windowTitle

    anchors.centerIn: parent
    text: windowTitle

    Process {
        id: titleProc
        command: ["sh", "-c", "hyprctl activewindow | grep title: | sed 's/[^:]*://g'"]
        running: true

        stdout: SplitParser {
            onRead: data => windowTitle = data
        }
    }

    function hyprEvent(e) {
        titleProc.running = true;
    }

    Component.onCompleted: {
        Hyprland.rawEvent.connect(hyprEvent)
    }

}
