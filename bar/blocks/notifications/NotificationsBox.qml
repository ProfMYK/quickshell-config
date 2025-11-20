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
    anchor.window: bar
    anchor.rect.x: parentWindow.width - root.implicitWidth
    anchor.rect.y: parentWindow.height + 5 
    visible: false

    property bool isOpen: false

    implicitWidth: background.implicitWidth
    implicitHeight: background.implicitHeight
    color: "RED"

    Box {
        id: background
        implicitWidth: 300
        implicitHeight: 500
        width: background.implicitWidth
        height: background.implicitHeight

        transform: Translate {
            id: posTransform
            y: 20
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
