import QtQuick 2.5
import Ossia 1.0 as Ossia
import QtGraphicalEffects 1.0

import CreativeControls 1.0 as CC

Item
{
    id:root
    anchors.fill: parent

    Ossia.OSCQueryServer
    {
        id: oscqDevice
        oscPort: 4456
        wsPort: 6688
        name: "photobooth"
    }

    Timer {
        interval: 10; running: true; repeat: true
        onTriggered: angle += 0.001
    }
    property real angle: 0
    property int clickedImage: 0
    Ossia.Property on clickedImage {
        device: oscqDevice
    }
    ListModel {
        id: photos
        ListElement { name: "lac.jpg" }
        ListElement { name: "bergen1.jpg" }
        ListElement { name: "bergen2.jpg" }
        ListElement { name: "montbeliard.jpg" }
        ListElement { name: "uk.jpg" }
    }

    Item {
        rotation: 1
        Ossia.Property on rotation {
            device: oscqDevice
        }

        id: rp
        anchors.fill: parent
        Repeater
        {
            model: photos
            Image
            {
                id: img
                source: "file:pics/" + name;
                width: 0.2 * root.width
                height: 0.2 * root.height
                rotation: rp.rotation * 360
                scale: rp.rotation

                x: ((root.width - width)/ 2)  * (1 + 0.6 * Math.cos(angle + 6.28 * index / photos.count))
                y: ((root.height - height)/ 2) * (1 + 0.6 * Math.sin(angle + 6.28 * index / photos.count))
            }
        }
        visible: false
    }

    Rectangle
    {
        height: parent.height
        width: parent.width * w
        property real w: 0
        Ossia.Property on w {
            device: oscqDevice
            node: '/width'
            min: 0
            max: 1
        }
        color: "pink"
        Ossia.Property on color {
            device: oscqDevice
        }
    }

    CC.Switch {
        anchors.centerIn: parent
        property bool toggled: false
        onToggle: toggled = !toggled;
        Ossia.Property on toggled {
            device: oscqDevice
        }

        width: 400
        height: 400
    }

    GammaAdjust {
        source: rp
        anchors.fill: parent
        gamma: 10
        Ossia.Property on gamma {
            device: oscqDevice
            min: -10
            max: 10
        }
    }


    Repeater
    {
        model: photos
        MouseArea
        {
            width: 0.3 * root.width
            height: 0.3 * root.height

            x: ((root.width - width)/ 2)  * (1 + 0.8 * Math.cos(angle + 6.28 * index / photos.count))
            y: ((root.height - height)/ 2) * (1 + 0.8 * Math.sin(angle + 6.28 * index / photos.count))

            onPressed: clickedImage = index
        }
    }
    Component.onCompleted: {
        oscqDevice.recreate(root)
    }

}
