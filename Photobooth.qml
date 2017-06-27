import QtQuick 2.5
import Ossia 1.0 as Ossia
import QtGraphicalEffects 1.0

import CreativeControls 1.0 as CC

Item
{
    id:root
    width: 640
    height: 480

    Ossia.OSCQueryServer
    {
        id: oscqDevice
        oscPort: 4456
        wsPort: 6688
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
                width: 0.3 * root.width
                height: 0.3 * root.height

                x: ((root.width - width)/ 2)  * (1 + 0.8 * Math.cos(angle + 6.28 * index / photos.count))
                y: ((root.height - height)/ 2) * (1 + 0.8 * Math.sin(angle + 6.28 * index / photos.count))
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

    GaussianBlur {
        source: rp
        anchors.fill: parent
        radius: 64
        Ossia.Property on radius {
            device: oscqDevice
            min: 0
            max: 64
        }
        samples: 64
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

}
