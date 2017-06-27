import QtQuick 2.5
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
import CreativeControls 1.0
import Ossia 1.0 as Ossia

Item {
    anchors.fill: parent

    id: root

    Ossia.OSCQueryClient
    {
        id: oscqDevice
        address: "ws://127.0.0.1:5678"
    }

    Column
    {
        GridLayout
        {
            rowSpacing: 5
            columnSpacing: 10
            Container {
                title: "Mod. ratio"
                Layout.column: 0
                Layout.row: 1
                Layout.alignment: Layout.Center
                AngleSlider {
                    anchors.centerIn: parent
                    id: modRatioSlider
                    Ossia.Binding {
                        // Scale the angle
                        on:  10 * (180 + parent.angle) / 360

                        // Send the value to '/modratio' node
                        node: '/modratio'
                        device: oscqDevice
                    }
                }
            }

            Container {
                title: "Mod. gain"
                Layout.column: 1
                Layout.row: 1
                Layout.alignment: Layout.Center
                AngleSlider {
                    id: modGainSlider
                    anchors.centerIn: parent
                    Ossia.Binding {
                        // Scale the angle
                        on:  24 * (180 + parent.angle) / 360 - 12

                        // Send the value to '/modgain' node
                        node: '/modgain'
                        device: oscqDevice
                    }
                }
            }

            Container {
                title: "Attack"
                Layout.column: 2
                Layout.row: 1
                Layout.alignment: Layout.Center

                AngleSlider {
                    id: attackSlider
                    anchors.centerIn: parent
                    Ossia.Binding {
                        // Scale the angle
                        on:  500 * (180 + parent.angle) / 360

                        // Send to '/attack' node
                        node: '/attack'
                        device: oscqDevice
                    }
                }
            }

            Container {
                title: "Release"
                Layout.column: 3
                Layout.row: 1
                Layout.alignment: Layout.Center

                AngleSlider {
                    id: decaySlider
                    anchors.centerIn: parent
                    Ossia.Binding {
                        // Scale the angle
                        on:  1000 * (180 + parent.angle) / 360

                        // Send to /decay node
                        node: '/decay'
                        device: oscqDevice

                    }
                }
            }


            Container {
                title: "Volume"
                Layout.column: 4
                Layout.row: 1
                Layout.alignment: Layout.Center

                AngleSlider {
                    id: volSlider
                    anchors.centerIn: parent
                    Ossia.Binding {
                        // Scale the angle
                        on:  (180 + parent.angle) / 360

                        // Send to /decay node
                        node: '/volume'
                        device: oscqDevice
                    }
                }
            }
        }

        Item {
            width: 10
            height: 10
        }

        Row {

            Container {
                title: "Filter"
                width: filterSlider.width + 20
                height: filterSlider.height + 20
                XYPad {
                    id: filterSlider
                    Ossia.Binding {
                        // Scale the angle
                        on: 200 + 1000 * parent.stickX

                        // Send to /decay node
                        node: '/lopass'
                        device: oscqDevice
                    }
                    Ossia.Binding {
                        // Scale the angle
                        on: 200 + 1000 * parent.stickY

                        // Send to /decay node
                        node: '/hipass'
                        device: oscqDevice
                    }
                }
            }

            Container {
                width: kbd.width + 20
                height: kbd.height + 20
                Keyboard
                {
                    id: kbd

                    width: 400
                    height: 200

                    firstKey: 24
                    lastKey: 53

                    Ossia.Binding {
                        // Scale the angle between 0 - 127
                        on:  Qt.point(kbd.pressedKeys[0].key.toFixed(0), kbd.pressedKeys[0].vel.toFixed(0))

                        // The value changes are sent to CC 34 on channel 1
                        node: '/note'
                        device: oscqDevice
                    }
                }
            }
        }
    }

    // map keycode to pitch
    function key2pitch(key){
        var pitch
        switch(key) {
            case 81:
                pitch = 0
                break;
            case 90:
                pitch = 1
                break;
            case 83:
                pitch = 2
                break;
            case 69:
                pitch = 3
                break;
            case 68:
                pitch = 4
                break;
            case 70:
                pitch = 5
                break;
            case 84:
                pitch = 6
                break;
            case 71:
                pitch = 7
                break;
            case 89:
                pitch = 8
                break;
            case 72: // 'h'
                pitch = 9
                break;
            case 85: // 'u'
                pitch = 10
                break;
            case 74: // 'j'
                pitch = 11
                break;
            case 75: // 'k'
                pitch = 12
                break;
        }
        return pitch
    }

    focus: true
    Keys.onPressed: {
        var pitch = key2pitch(event.key)
        if (pitch !== undefined){
            var note = { key: pitch + kbd.firstKey, vel: 100 }
            //kbd.pressedKeys = [ note ]
            kbd.setPressed(note)
            console.log(note.key + " " + note.vel)
        }
    }

    Keys.onReleased: {
        var pitch = key2pitch(event.key)
        if (pitch !== undefined && kbd.isPressed(pitch + kbd.firstKey)){
            kbd.setPressed([])
        }
    }

    Component.onCompleted:
    {
        // Call this at the end to set-up the connections
        connect()
    }

    function connect() {
        if (oscqDevice.openOSCQueryClient(oscqDevice.address, oscqDevice.localPort)){
            console.log("connected to " + oscqDevice.address)
        }

        oscqDevice.remap(root)
    }

}
