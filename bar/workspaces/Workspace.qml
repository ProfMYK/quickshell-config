import Quickshell
import Quickshell.Widgets
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

import "../../components"
import "../.."
import "."

Box {
    id: root
    property HyprlandWorkspace workspace
    property var clients
    color: getBackgroundColor(workspace.focused, mouseArea.containsMouse) 

    implicitWidth: icons.width + 25

    function getName(clients, workspace) {
        return workspace.name
    }

    function getBackgroundColor(focused, hovering) {
        if (hovering) {
            return Colors.background2
        }
        if (focused) {
            return Colors.border;
        }
        return Colors.background;
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            Hyprland.dispatch("workspace " + workspace.name)
        }
    }

    Process {
        id: clientsProc
        command: ["sh", "-c", "hyprctl clients -j"] 
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                let data = this.text
                root.clients = JSON.parse(data)

                root.clients = root.clients.filter(client => {
                    return root.workspace.focused && client["workspace"]["name"] == root.workspace.name
                })
            }
        }

        function hyprEvent(e) {
            if (e.name.includes("workspace") || e.name === "openwindow" || e.name === "closewindow") {
                clientsProc.running = true;
            }
        }

        Component.onCompleted: {
            Hyprland.rawEvent.connect(hyprEvent)
        }
    }

    BarText {
        visible: (root.clients == undefined || root.clients.length == 0) ? 1 : 0
        color: root.workspace.focused ? Colors.foreground : Colors.border 
        text: workspace.name
    }

    RowLayout {
        visible: (root.clients == undefined || root.clients.length == 0) ? 0 : 1
        id: icons        
        anchors.centerIn: parent
        spacing: 5
        Repeater {
            model: root.clients

            delegate: Icon {
                className: modelData["class"]
            }
        }
    }

    Behavior on color {
        ColorAnimation {
            duration: 100
        }
    }
}
