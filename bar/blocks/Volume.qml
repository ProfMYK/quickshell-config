import Quickshell // for PanelWindow
import Quickshell.Io;
import QtQuick // for Text
import QtQuick.Controls // for Text
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Services.Pipewire

import "."
import "../../components"
import "controllers"

Box {
    id: box
    implicitWidth: volumeText.width + 25
    property bool is_visible: true
    BarText {
        id: volumeText
        text: "󰕾 " + `${Math.floor(linkTracker.node.audio.volume * 100)}%`
    }

    MouseArea {
        id: area
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            is_visible = !is_visible
        }
    }

    PwNodeLinkTracker {
        id: linkTracker
        node: Pipewire.defaultAudioSink
    }

    VolumeController {
        isOpen: box.is_visible 
        node: linkTracker.node
    }
}
