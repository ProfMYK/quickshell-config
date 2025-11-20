import Quickshell // for PanelWindow
import Quickshell.Io;
import QtQuick // for Text
import QtQuick.Controls // for Text
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Services.Notifications

import "."
import "../../../components"
import "../../.."

HoverBox {
    property string summary 
    property string body
    id: root
    width: 300
    height: 100 

    property bool isOpen: true

    ColumnLayout {
        id: layout
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 12.5
        width: 275
        spacing: 0
        BarText {
            anchors.centerIn: undefined
            text: summary
            font.pointSize: 15
            font.bold: true
        }
        BarText {
            anchors.centerIn: undefined
            text: body
            Layout.fillWidth: true
            wrapMode: Text.Wrap
        }
    }
}
