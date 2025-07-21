// CustomTooltip.qml
import QtQuick

Item {
    id: root
    property alias text: tooltipText.text

    Rectangle {
        id: tooltip
        width: tooltipText.contentWidth + 10
        height: tooltipText.contentHeight + 6
        color: "#333"
        radius: 3
        border { width: 1; color: "#555" }

        Text {
            id: tooltipText
            anchors.centerIn: parent
            color: "white"
            font.pointSize: 9
        }
    }
}
