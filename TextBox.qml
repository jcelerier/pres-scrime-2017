import QtQuick 2.0
Rectangle
{
    property alias text: t.text
    border.width: 2
    border.color: "#555"
    radius: 4
    color: "#ccc"
    width: 150
    height: 50
    Text
    {
        id: t
        anchors.centerIn: parent
        font.family: "Fira Sans"
        font.pointSize: 18

    }
}
