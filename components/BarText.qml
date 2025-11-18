import Quickshell // for PanelWindow
import Quickshell.Io;
import QtQuick // for Text
import Quickshell.Hyprland

import ".."

Text {
    font.family: "DepartureMono Nerd Font"
    color: Colors.foreground
    anchors.centerIn: parent
    Behavior on opacity { 
        NumberAnimation { 
            duration: 100 
            easing.type: Easing.InOutQuad
        } 
    } 
}
