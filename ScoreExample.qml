import QtQuick 2.5 as QQ2
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
import CreativeControls 1.0
import Ossia 1.0 as Ossia
import QtQuick.Scene3D 2.0

import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Extras 2.0


QQ2.Item {
    // Needs to show-case :
    // * trigger
    // * condition
    // * speed
    // * temporal progression
    anchors.fill: parent

    Ossia.OSCQueryServer
    {
        id: oscqDevice
        oscPort: 4455
        wsPort: 5577
        name: "3dscore"
    }

    Scene3D {
        id: scene3d
        anchors.fill: parent
        anchors.margins: 10
        focus: true
        aspects: ["input", "logic"]
        cameraAspectRatioMode: Scene3D.AutomaticAspectRatio

        Entity {
            id: sceneRoot

            Camera {
                id: camera
                projectionType: CameraLens.PerspectiveProjection
                fieldOfView: 90
                Ossia.Property on fieldOfView {
                    min: 1
                    max: 360
                    device: oscqDevice
                }
                nearPlane : 0.001
                Ossia.Property on position {
                    device: oscqDevice
                }
                farPlane : 10000.0
                position: Qt.vector3d( 0.0, 0.0, 40.0 )
                upVector: Qt.vector3d( 0.0, 1.0, 0.0 )
                viewCenter: Qt.vector3d( 0.0, 0.0, 0.0 )
            }

            FirstPersonCameraController { camera: camera }

            components: [
                RenderSettings {
                    activeFrameGraph: ForwardRenderer {
                        camera: camera
                        clearColor: "transparent"
                    }
                },
                InputSettings { }
            ]

            SphereMaterial {
                id: m
                maincolor: "red"
                dev: oscqDevice
            }


            QQ2.Component
            {
                id: sc
                SphereParticle {
                    id: part
                    material: m
                }
            }

            //QQ2.Component.onCompleted: numSpheres = 500

            property int numSpheres: 0
            Ossia.Property on numSpheres {
                min: 0
                max: 1000
                device: oscqDevice
            }

            onNumSpheresChanged: {
                if(numSpheres > sceneRoot.spheres.length)
                {
                    for(var i = sceneRoot.spheres.length; i < numSpheres; i++) {
                        var size = 25
                        var obj = sc.createObject(sceneRoot);
                        obj.pos.x = Math.random() * size - size / 2
                        obj.pos.y = Math.random() * size - size / 2
                        obj.pos.z = Math.random() * size - size / 2
                        console.log(obj.pos)
                        sceneRoot.spheres.push(obj);
                    }
                }
                else if(numSpheres < sceneRoot.spheres.length)
                {
                    while(sceneRoot.spheres.length > numSpheres)
                    {
                        var obj = sceneRoot.spheres.pop();
                        obj.destroy();
                    }
                }
            }

            property var spheres: []

            property real rSpeed: 0.
            Ossia.Property on rSpeed {
                min: -1
                max: 1
                device: oscqDevice
            }
            property real phiSpeed: 0.
            Ossia.Property on phiSpeed {
                min: -1
                max: 1
                device: oscqDevice
            }
            QQ2.Timer {
                interval: 16; running: true; repeat: true

                function toSpherical(vec)
                {
                    var r = Math.sqrt(vec.x * vec.x + vec.y * vec.y + vec.z * vec.z);
                    var theta = Math.acos(vec.z / r)
                    var phi = Math.atan2(vec.y, vec.x)
                    return Qt.vector3d(r, theta, phi);
                }

                function toCart(vec)
                {
                    var x = vec.x * Math.sin(vec.y) * Math.cos(vec.z);
                    var y = vec.x * Math.sin(vec.y) * Math.sin(vec.z);
                    var z = vec.x * Math.cos(vec.y);
                    return Qt.vector3d(x,y,z);
                }

                onTriggered: {
                    for(var i = 0; i < sceneRoot.spheres.length; i++) {
                        var sph = toSpherical(sceneRoot.spheres[i].pos);
                        sph.x += sceneRoot.rSpeed;
                        sph.z += sceneRoot.phiSpeed;
                        sceneRoot.spheres[i].pos = toCart(sph);
                    }
                }
            }
        }

    }

}
