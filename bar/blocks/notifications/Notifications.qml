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
    visible: true

    property ListModel notifications

    // implicitWidth: layout.implicitWidth > 0  ? layout.implicitWidth : 1
    // implicitHeight: layout.implicitHeight > 0 ? layout.implicitHeight : 1
    implicitWidth: 300
    // implicitHeight: layout.height > 0 ? layout.height : 1
    implicitHeight: layout.count > 0 ? layout.count * 110 - 10 : 1
    color: "TRANSPARENT"

    ListView {
        id: layout
        anchors.fill: parent
        model: notifications
        height: contentHeight
        spacing: 10
        delegate: NotificationBox {
            summary: model.summary
            body: model.body
            MouseArea {
                anchors.fill: parent
                onClicked: notifications.remove(index)
            } 
            // 🕒 THE TIMER
            Timer {
                interval: model.timeout // 3 seconds
                running: true  // Start counting as soon as this box spawns
                repeat: false  // Run only once

                onTriggered: {
                    // 'index' is a special variable available inside delegates
                    // providing the current position of this item
                    notifications.remove(index) 
                }
            }
        }

        displaced: Transition {
            NumberAnimation { properties: "x,y"; duration: 200; easing.type: Easing.InOutQuad }
        }

        remove: Transition {
            ParallelAnimation {
                NumberAnimation { property: "x"; to: 100; duration: 200; easing.type: Easing.InOutQuad }
                NumberAnimation { property: "opacity"; to: 0; duration: 150; easing.type: Easing.InOutQuad }
            }
        }

        add: Transition {
            SequentialAnimation {
                PauseAnimation {
                    duration: 400
                }
                ParallelAnimation {
                    NumberAnimation { property: "x"; to: 0; duration: 200; easing.type: Easing.InOutQuad }
                    NumberAnimation { property: "opacity"; to: 100; duration: 150; easing.type: Easing.InOutQuad }
                }
            }
        }
    }

    Behavior on implicitHeight {
        SequentialAnimation {
            PauseAnimation {
                duration: 400
            }
            PropertyAction {} 
        }
    }
}
