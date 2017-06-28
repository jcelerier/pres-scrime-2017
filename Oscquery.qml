import QtWebEngine 1.5
import QtQuick 2.5
import QtQuick.Controls 2.1
Item
{

    anchors.fill: parent
    Column {
        anchors.fill: parent
        anchors.centerIn: parent
        Row {
            TextField {
                id: field
                text: "http://127.0.0.1:5678/"
                onEditingFinished: engine.url = text
                width: 400

            }
            Item { width: 3; height: 1 }
            Button {
                text: "http://127.0.0.1:5678/modratio"
                onClicked: {
                    field.text = text
                    engine.url = text

                }
            }
            Item { width: 3; height: 1 }
            Button {
                text: "https://github.com/mrRay/OSCQueryProposal/"
                onClicked: {
                    field.text = text
                    engine.url = text
                }
            }
        }

        WebEngineView {
            id: engine
            url: "http://127.0.0.1:5678/"
            width: parent.width
            height: 600
        }
    }

}
