import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import QtQuick
import Quickshell.Widgets

import "../../components"

Rectangle {
    implicitWidth: icon.width
    implicitHeight: icon.height
    property string className
    color: "TRANSPARENT"

    IconImage {
        id: icon
        property string imgPath
        source: imgPath
        implicitSize: 20
        Process {
            id: iconProc
            command: ["sh", "-c", "/home/fortran/.config/quickshell/scripts/get_icon.sh " + className]
            running: true

            stdout: StdioCollector {
                onStreamFinished: {
                    icon.imgPath = "file:/" + this.text.replace(/\s/g, '');
                }
            }
        }
    }
}
