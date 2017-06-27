
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import QtQuick 2.5 as QQ
import Ossia 1.0 as Ossia
Material {
    id: root
    property var dev
    function clamp(val, min, max) {
      return Math.min(Math.max(this, min), max);
    }
    property color maincolor: Qt.rgba(0.0, 0.0, 0.0, 1.0)


    property real hexsize: 0.1
    Ossia.Property on hexsize
    {
        node: '/hexsize'
        min: 0.001
        max: 1.
        device: dev
    }

    property real scaleP: 1000.
    Ossia.Property on scaleP
    {
        node: '/scale'
        min: 0.001
        max: 10000.
        device: dev
    }


    property real hue: 0.5
    Ossia.Property on hue
    {
        node: '/hue'
        min: 0.
        max: 1.
        device: dev
    }


    property real border: 1.0
    Ossia.Property on border
    {
        node: '/border'
        min: 0.
        max: 100.
        device: dev
    }

    property real spacing: 10.0
    Ossia.Property on spacing
    {
        node: '/spacing'
        min: 0.
        max: 100.
        device: dev
    }

    parameters: [
        Parameter {
            name: "maincolor"
            value: Qt.vector3d(root.maincolor.r, root.maincolor.g, root.maincolor.b)
        }
        , Parameter {
            name: "time"
            value: 0.
        }
        , Parameter {
            name: "hue"
            value: hue
        }
        , Parameter {
            name: "hexsize"
            value: hexsize
        }
        , Parameter {
            name: "border"
            value: border
        }
        , Parameter {
            name: "spacing"
            value: spacing
        }
        , Parameter {
            name: "scale"
            value: scaleP
        }
        , Parameter {
            name: "mouse"
            value: Qt.vector2d(0., 0.)
        }
        , Parameter {
            name: "resolution"
            value: Qt.vector2d(640., 480.)
        }
    ]


    effect: Effect {

        property string vertex: "file:shaders/gl3/simpleColor.vert"
        property string fragment: "file:shaders/gl3/simpleColor.frag"
        property string vertexES: "file:shaders/es2/simpleColor.vert"
        property string fragmentES: "file:shaders/es2/simpleColor.frag"

        FilterKey {
            id: forward
            name: "renderingStyle"
            value: "forward"
        }

        ShaderProgram {
            id: gl3Shader
            vertexShaderCode: loadSource(parent.vertex)
            fragmentShaderCode: loadSource(parent.fragment)
        }
        ShaderProgram {
            id: es2Shader
            vertexShaderCode: loadSource(parent.vertexES)
            fragmentShaderCode: loadSource(parent.fragmentES)
        }

        techniques: [
            // OpenGL 3.1
            Technique {
                filterKeys: [forward]
                graphicsApiFilter {
                    api: GraphicsApiFilter.OpenGL
                    profile: GraphicsApiFilter.CoreProfile
                    majorVersion: 3
                    minorVersion: 1
                }
                renderPasses: RenderPass {
                    shaderProgram: gl3Shader
                }
            },
            // OpenGL 2.0
            Technique {
                filterKeys: [forward]
                graphicsApiFilter {
                    api: GraphicsApiFilter.OpenGL
                    profile: GraphicsApiFilter.NoProfile
                    majorVersion: 2
                    minorVersion: 0
                }
                renderPasses: RenderPass {
                    shaderProgram: es2Shader
                }
            },
            // ES 2.0
            Technique {
                filterKeys: [forward]
                graphicsApiFilter {
                    api: GraphicsApiFilter.OpenGLES
                    profile: GraphicsApiFilter.CoreProfile
                    majorVersion: 2
                    minorVersion: 0
                }
                renderPasses: RenderPass {
                    shaderProgram: es2Shader
                }
            }
        ]
    }
}
