
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Extras 2.0

Entity
{
    property alias radius: sphereMesh.radius
    property alias pos: transf.translation
    property var material
    SphereMesh {
        id: sphereMesh
        radius: 3
    }

    Transform {
        id: transf
    }

    components: [ sphereMesh, material, transf ]
}
