import QtQuick
import Quickshell.Io
import Quickshell

import ".."
import "../.."
import "../../components"

Box {
    implicitWidth: text.implicitWidth + 25
    property bool toggle: true

    BarText {
        id: text
        text: toggle ? Time.minutes : Time.fancyTime
    }

    BarText {
        id: dateText
        text: Time.fancyTime
        opacity: toggle ? 0 : 1
    }

    BarText {
        id: timeText
        text: Time.minutes
        opacity: toggle ? 1 : 0
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        onClicked: {
            toggle = !toggle
        }
    }

    Behavior on implicitWidth {
        NumberAnimation {
            duration: 50
        }
    }
}
