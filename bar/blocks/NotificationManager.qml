import Quickshell // for PanelWindow
import Quickshell.Io;
import QtQuick // for Text
import QtQuick.Controls // for Text
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Services.Notifications

import "."
import "../../components"
import "../.."
import "notifications"

HoverBox {
    id: root
    implicitWidth: text.width + 25
    property bool isVisible: false

    ListModel {
        id: notifications
    }

    BarText {
        id: text
        text: ""
    }

    Notifications {
        notifications: notifications
    }

    MouseArea {
        id: area
        anchors.fill: parent
        onClicked: {
            isVisible = !isVisible
        }
    }
    //
    // NotificationsBox {
    //     isOpen: root.isVisible
    // }
    //

    NotificationServer {
        id: notificationServer
        onNotification: (notification) => {
            console.log("Summary: " + notification.summary)
            console.log("Body: " + notification.body)
            console.log("Timeout: " + notification.expireTimeout < 0 ? notification.expireTimeout * 1000 : 10)
            notifications.append({
                summary: notification.summary, 
                body: notification.body,
                timeout: notification.expireTimeout > 0 ? notification.expireTimeout * 1000 : 3 * 1000,
            })
        }
    }
}
