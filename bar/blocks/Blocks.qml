import QtQuick
import Quickshell
import QtQuick.Layouts

import "."

RowLayout {
    anchors.verticalCenter: parent.verticalCenter
    anchors.right: parent.right

    Battery {}
    Clock {}
}
