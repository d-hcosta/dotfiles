import Quickshell
import QtQuick
import QtQuick.Controls
import Quickshell.Services.UPower
import Quickshell.Services.Pipewire
import "./utils"

Scope {
    Variants {
        model: Quickshell.screens
    }

    SystemClock {
        id: clock
    }
    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }

    PanelWindow {
        id: toplevel
        property var modelData
        anchors {
            top: true
            left: true
            right: true
        }

        implicitHeight: 34
        color: "#0f0f0f"

        PopupWindow {
            id: popup
            anchor.window: toplevel
            anchor.rect.x: parentWindow.width - width - 16
            anchor.rect.y: parentWindow.height + 16
            color: "transparent"
            width: 160
            height: 40
            visible: false

            Rectangle {

                anchors.fill: parent
                color: "#0f0f0f"
                radius: 60
                border.color: "#303030"
                border.width: 1

                Label {
                    wrapMode: Text.WordWrap
                    anchors.fill: parent

                    anchors.topMargin: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 9
                    color: "#fff"
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "SF-Pro"
                    text: "Performance mode"
                }
            }
        }

        Row {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 16
            spacing: 26

            FolderWidget {
                label: `Desktop`
            }
            FolderWidget {
                label: `Downloads`
            }
            FolderWidget {
                label: `Documents`
            }
            FolderWidget {
                label: `Pictures`
            }
            FolderWidget {
                label: `.config`
            }
        }

        Row {
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 10
            spacing: 16

            Label {
                anchors.verticalCenter: parent.verticalCenter

                text: `${parseInt(UPower.displayDevice.percentage * 100)}%`

                color: "#fff"
                font.pointSize: 9
                font.family: "SF-Pro"
            }

            Image {
                id: battery
                anchors.verticalCenter: parent.verticalCenter
                source: `icons/battery/${UPower.displayDevice.iconName}.svg`
                width: 18
                height: 18
                smooth: true
                fillMode: Image.PreserveAspectFit
                sourceSize.width: 18
                sourceSize.height: 18

                transform: [
                    Translate {
                        y: -1
                    }
                ]
            }

            Label {
                anchors.verticalCenter: parent.verticalCenter

                text: `${Network.active.ssid}`
                color: "#fff"
                font.pointSize: 9
                font.family: "SF-Pro"
            }

            Image {
                id: wifi
                anchors.verticalCenter: parent.verticalCenter
                source: `icons/wifi/${Math.floor(Network.active.strength / 10)}.svg`
                width: 16
                height: 16
                smooth: true
                fillMode: Image.PreserveAspectFit
                sourceSize.width: 16
                sourceSize.height: 16

                transform: [
                    Translate {
                        y: -2
                    }
                ]
            }

            Image {
                id: muted
                anchors.verticalCenter: parent.verticalCenter
                source: `icons/sound/${Pipewire.defaultAudioSink?.audio.muted ? 'muted' : 'normal'}.svg`
                width: 16
                height: 16
                smooth: true
                fillMode: Image.PreserveAspectFit
                sourceSize.width: 16
                sourceSize.height: 16

                transform: [
                    Translate {
                        y: -1
                    }
                ]
            }

            Label {
                anchors.verticalCenter: parent.verticalCenter

                property string date: clock.date.toDateString()

                text: `${date}`
                color: "#fff"
                font.pointSize: 9
                font.family: "SF-Pro"
            }
            Label {
                anchors.verticalCenter: parent.verticalCenter

                property string hours: clock.hours.toString().padStart(2, '0')
                property string minutes: clock.minutes.toString().padStart(2, '0')

                text: `${hours}:${minutes}`
                color: "#fff"
                font.pointSize: 9
                font.family: "SF-Pro"
            }
        }
    }
}
