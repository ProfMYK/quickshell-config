import Quickshell // for PanelWindow
import Quickshell.Io;
import QtQuick // for Text
import QtQuick.Controls // for Text
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Services.Pipewire

import "."
import "../../components"
import "../.."
import "volume"

HoverBox {
    id: box
    implicitWidth: volumeText.width + 25
    property bool is_visible: false
    BarText {
        id: volumeText
        text: "󰕾 " + `${Math.floor(linkTracker.node.audio.volume * 100)}%`
    }

    PwNodeLinkTracker {
        id: linkTracker
        node: Pipewire.defaultAudioSink
    }

    VolumeController {
        isOpen: box.is_visible 
        node: linkTracker.node
    }

    MouseArea {
        id: area
        anchors.fill: parent
        onClicked: {
            is_visible = !is_visible
        }
    }
}
