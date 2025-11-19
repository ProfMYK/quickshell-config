import QtQuick
import Quickshell.Io
import Quickshell

import ".."
import "../.."
import "../../components"

Box {
    id: root
    property int battery
    property bool isCharging

    implicitWidth: textWidget.width + 25
    BarText {
        id: textWidget
        
        Process {
            id: statProc
            command: ["sh", "-c", "acpi -b | grep -Eo Charging'"] 
            running: true

            stdout: SplitParser {
                onRead: data => {
                    isCharging = data == "Charging"
                }
            }
        }

        Process {
            id: batProc
            command: ["sh", "-c", "acpi -b | grep -Eo '[0-9]+' | head -n 2 | tail -n 1"] 
            running: true

            stdout: SplitParser {
                onRead: data => {
                    battery = parseInt(data)
                }
            }
        }
        
        function getText(battery, isCharging) {
            let icon = "󰁺";

            if (battery >= 0 && battery < 10) {
                icon = "󰂎";
            } else if (battery >= 10 && battery < 20) {
                icon = "󰁺";
            } else if (battery >= 20 && battery < 30) {
                icon = "󰁻";
            } else if (battery >= 30 && battery < 40) {
                icon = "󰁼";
            } else if (battery >= 40 && battery < 50) {
                icon = "󰁽";
            } else if (battery >= 50 && battery < 60) {
                icon = "󰁾";
            } else if (battery >= 60 && battery < 70) {
                icon = "󰁿";
            } else if (battery >= 70 && battery < 80) {
                icon = "󰂀";
            } else if (battery >= 80 && battery < 90) {
                icon = "󰂁";
            } else if (battery >= 90 && battery < 100) {
                icon = "󰂂";
            } else {
                icon = "󰁹"
            }

            if (isCharging) {
                icon = "󰂄"
            }

            return battery.toString() + "% " + icon;
        }

        text: getText(battery, isCharging) 
    }
}
