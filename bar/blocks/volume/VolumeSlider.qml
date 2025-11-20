import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets

import "../../../components"
import "../../.."

Box {
    required property PwNode node
    PwObjectTracker { objects: [ node ] }
    id: box
    width: layout.width + 25
    height: layout.height + 25
    color: Colors.background2
    ColumnLayout {
        id: layout
        anchors.centerIn: parent
        RowLayout {
            Layout.preferredWidth: 560
            BarText {
                anchors.centerIn: undefined
                text: {
                    const app = node.properties["application.name"] ?? (node.description != "" ? node.description : node.name);
                    const media = node.properties["media.name"];
                    return media != undefined ? `${app} - ${media}` : app;
                }
            }
            HoverBox {
                Layout.alignment: Qt.AlignRight
                implicitWidth: text.width + 25

                BarText {
                    id: text
                    text: node.audio.muted ? "unmute" : "mute"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: node.audio.muted = !node.audio.muted
                }
            }

        }
        RowLayout {
            BarText {
                anchors.centerIn: undefined
                Layout.preferredWidth: 50
                text: "󰕾 " + `${Math.floor(node.audio.volume * 100)}%`
            }
            Slider {
                Layout.fillWidth: true
                value: node.audio.volume
                onValueChanged: node.audio.volume = value
            }
        }
    }
}
