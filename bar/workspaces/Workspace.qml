import Quickshell
import QtQuick
import Quickshell.Hyprland

import "../"
import "../../"

Box {
    height: 30
    width: 30

    property HyprlandWorkspace workspace
    color: workspace.focused ? Colors.border : Colors.background

    function getName(name) {
        switch (name) {
            case "1": return "";
            case "2": return "󰖟";
            default: return name;
        }
    }

    BarText {
        text: getName(workspace.name)
    }
}
