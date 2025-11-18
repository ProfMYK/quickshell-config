import Quickshell // for PanelWindow
import Quickshell.Io;
import QtQuick // for Text
import Quickshell.Hyprland

import "../Theme.qml" as Theme
import "."

Box {
    anchors.centerIn: parent
    anchors.top: parent.top
    property string windowTitle

    anchors.topMargin: 100

    BarText {
        anchors.centerIn: parent
        color: "WHITE"
        id: titleText

        text: windowTitle

        Process {
            id: titleProc
            command: ["sh", "-c", "hyprctl activewindow | grep title: | sed 's/[^:]*: //g'"]
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

    width: titleText.implicitWidth + 15
    height: 20 

}
