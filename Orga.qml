import QtQuick 2.0

Item
{
    anchors.fill: parent

    Rectangle {
        id: rectangle3
        x: 8
        y: 8
        width: 555
        height: 479
        color: "#c5c4c4"

        Rectangle {
            id: rectangle2
            x: 203
            y: 63
            width: 335
            height: 189
            color: "#d4cdc2"
            radius: 19
            TextBox {
                id: textBox13
                x: 115
                y: 66
                width: 100
                text: "Dataspace"
            }

            TextBox {
                id: textBox14
                x: 221
                y: 66
                width: 100
                text: "Loop"
            }

            TextBox {
                id: textBox15
                x: 9
                y: 66
                width: 100
                text: "Curve"
            }

            TextBox {
                id: textBox16
                x: 221
                y: 10
                width: 100
                text: "Mapping"
            }

            TextBox {
                id: textBox17
                x: 115
                y: 10
                width: 100
                text: "Dataflow"
            }

            TextBox {
                id: textBox18
                x: 9
                y: 10
                width: 100
                text: "Scenario"
            }

            Text {
                id: text3
                x: 108
                y: 138
                text: qsTr("Modèles")
                font.pixelSize: 30
                font.styleName: "Fira Sans"
            }
            border.width: 5
        }

        Rectangle {
            id: rectangle1
            x: 16
            y: 63
            width: 169
            height: 401
            color: "#d4cdc2"
            radius: 19
            border.width: 5

            TextBox {
                id: textBox5
                x: 8
                y: 206
                text: "ossia-unity3D"
            }

            TextBox {
                id: textBox4
                x: 8
                y: 143
                text: "ossia-max"
            }

            TextBox {
                id: textBox3
                x: 8
                y: 78
                text: "ossia-pd"
            }

            TextBox {
                id: textBox2
                x: 9
                y: 19
                text: "ossia-qt"
            }

            Text {
                id: text2
                x: 23
                y: 340
                text: qsTr("Portages")
                font.pixelSize: 30
                font.styleName: "Fira Sans"
            }

            TextBox {
                id: textBox12
                x: 9
                y: 269
                text: "ossia-python"
            }



        }

        Rectangle {
            id: rectangle
            x: 203
            y: 268
            width: 335
            height: 196
            color: "#d4cdc2"
            radius: 19
            border.width: 5

            Text {
                id: text1
                x: 96
                y: 143
                text: qsTr("Protocoles")
                font.pixelSize: 30
                font.styleName: "Fira Sans"
            }

            TextBox {
                id: textBox6
                x: 9
                y: 10
                width: 100
                text: "OSC"
            }

            TextBox {
                id: textBox7
                x: 115
                y: 10
                width: 100
                text: "MIDI"
            }

            TextBox {
                id: textBox8
                x: 221
                y: 10
                width: 100
                text: "OSCQuery"
            }

            TextBox {
                id: textBox9
                x: 9
                y: 66
                width: 100
                text: "Série"
            }

            TextBox {
                id: textBox10
                x: 221
                y: 66
                width: 100
                text: "..."
            }

            TextBox {
                id: textBox11
                x: 115
                y: 66
                width: 100
                text: "HTTP"
            }











        }

        Text {
            id: text4
            x: 227
            y: 8
            text: qsTr("libossia")
            style: Text.Normal
            font.pixelSize: 30
        }









    }

    Rectangle {
        id: rectangle4
        x: 584
        y: 8
        width: 555
        height: 479
        color: "#c5c4c4"
        Rectangle {
            id: rectangle5
            x: 8
            y: 63
            width: 530
            height: 189
            color: "#d4cdc2"
            radius: 19
            TextBox {
                id: textBox19
                x: 115
                y: 66
                width: 100
                text: "Dataspace"
            }

            TextBox {
                id: textBox20
                x: 221
                y: 66
                width: 100
                text: "Loop"
            }

            TextBox {
                id: textBox21
                x: 9
                y: 66
                width: 100
                text: "Curve"
            }

            TextBox {
                id: textBox22
                x: 221
                y: 10
                width: 100
                text: "Mapping"
            }

            TextBox {
                id: textBox23
                x: 115
                y: 10
                width: 100
                text: "Dataflow"
            }

            TextBox {
                id: textBox24
                x: 9
                y: 10
                width: 100
                text: "Scenario"
            }

            Text {
                id: text5
                x: 108
                y: 138
                text: qsTr("Plugins")
                font.pixelSize: 30
                font.styleName: "Fira Sans"
            }
            border.width: 5
        }

        Rectangle {
            id: rectangle7
            x: 203
            y: 268
            width: 335
            height: 196
            color: "#d4cdc2"
            radius: 19
            Text {
                id: text7
                x: 96
                y: 143
                text: qsTr("Protocoles")
                font.pixelSize: 30
                font.styleName: "Fira Sans"
            }

            TextBox {
                id: textBox30
                x: 9
                y: 10
                width: 100
                text: "OSC"
            }

            TextBox {
                id: textBox31
                x: 115
                y: 10
                width: 100
                text: "MIDI"
            }

            TextBox {
                id: textBox32
                x: 221
                y: 10
                width: 100
                text: "OSCQuery"
            }

            TextBox {
                id: textBox33
                x: 9
                y: 66
                width: 100
                text: "Série"
            }

            TextBox {
                id: textBox34
                x: 221
                y: 66
                width: 100
                text: "..."
            }

            TextBox {
                id: textBox35
                x: 115
                y: 66
                width: 100
                text: "HTTP"
            }
            border.width: 5
        }

        Text {
            id: text8
            x: 227
            y: 8
            text: qsTr("i-score")
            font.pixelSize: 30
            style: Text.Normal
        }
    }

    TextBox {
        id: textBox
        x: 612
        y: 276
        text: "Éditeur"
    }

    TextBox {
        id: textBox1
        x: 612
        y: 335
        text: "Lecteur"
    }

}
