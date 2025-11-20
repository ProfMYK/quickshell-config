import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets

import "../../../components"
import "../../.."
import "."

PopupWindow {
    id: root
    required property PwNode node;
    required property var linkgroups;
    PwObjectTracker { objects: [ node ] }

    anchor.window: bar
    anchor.rect.x: parentWindow.width - root.implicitWidth
    anchor.rect.y: parentWindow.height + 5 
    visible: false

    property bool isOpen: false

    implicitWidth: background.implicitWidth
    implicitHeight: background.implicitHeight
    color: "TRANSPARENT"
    Box {
        id: background
        implicitHeight: layout.implicitHeight + 25
        implicitWidth: layout.implicitWidth + 25 
        height: layout.height + 25
        width: layout.width + 25

        transform: Translate {
            id: posTransform
            y: 20 // Start 20 pixels down
        }

        anchors.centerIn: parent
        ColumnLayout {
            id: layout
            spacing: 12.5
            anchors.centerIn: parent
            VolumeSlider {
                node: root.node
            }
            Repeater {
                model: linkTracker.linkGroups

                VolumeSlider {
                    required property PwLinkGroup modelData
                    node: modelData.source
                }
            }
        }

        ParallelAnimation {
            id: enterAnim
            running: root.isOpen 
            
            NumberAnimation { target: posTransform; property: "y"; to: 0; duration: 250; easing.type: Easing.OutCubic }
            NumberAnimation { target: background; property: "opacity"; to: 1; duration: 200 }
            NumberAnimation {
                target: root
                property: "visible"
                duration: 1 
                to: 1
                easing.type: Easing.InOutQuad
            }
        }

        ParallelAnimation {
            id: exitAnim
            running: !root.isOpen && root.visible
            
            NumberAnimation { target: posTransform; property: "y"; to: 20; duration: 200; easing.type: Easing.InQuad }
            NumberAnimation { target: background; property: "opacity"; to: 0; duration: 150 }
            NumberAnimation {
                target: root
                property: "visible"
                duration: 200 
                to: 0
                easing.type: Easing.InOutQuad
            }
        }

    }
}

