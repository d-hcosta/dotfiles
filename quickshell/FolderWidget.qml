import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Controls

Rectangle {
    required property string label

    width: labelText.implicitWidth
    height: labelText.implicitHeight + 10
    anchors.verticalCenter: parent.verticalCenter

    color: "transparent"
    Label {
        id: labelText
        anchors.verticalCenter: parent.verticalCenter

        text: label
        color: "#fff"
        font.pointSize: 9
        font.family: "SF-Pro-Display"
    }
    MouseArea {
        id: ma
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
        onEntered: {
            onHover.start();
        }

        onExited: {
            exitHover.start();
        }
        onClicked: {
            openNaut.startDetached();
        }
        PropertyAnimation {
            id: onHover
            target: labelText
            properties: "color"
            from: "#ffffff"
            to: "#bdbdbd"
            duration: 100
        }
        PropertyAnimation {
            id: exitHover
            target: labelText
            properties: "color"
            to: "#fff"
            duration: 100
        }
    }

    Process {
        id: openNaut

        command: ["nautilus", `/home/vrag/${label}`]
        running: false
    }
}
