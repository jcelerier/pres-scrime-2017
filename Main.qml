import QtQuick.Controls 2.2 as QC
import CreativeControls 1.0 as CC
import Ossia 1.0 as Ossia
import Qt.labs.presentation 1.0
import QtQuick 2.5
import QtMultimedia 5.5

Presentation
{
    id: presentation

    mouseNavigation: false
    width: 1440
    height: 900
    /*
    Ossia.Logger {
        id: logger
        appName: "Slides"
        loggerHost: "ws://127.0.0.1:1337"
    }
    */

    Rectangle {
        anchors.fill: parent
        color: "#EEEEEE"
    }

    SlideCounter {}
    Clock {}


    Frame {
        centeredText: "i-score: état des lieux"
    }

    Frame {
        title: "Programme"
        content: [
            "Organisation générale",
            "Modèles d'objets",
            "Modèle de temps",
            "Modèles de données",
            "Répartition",
            "Conclusion"
        ]
    }

    Frame {
        title: "Organisation générale"
        Orga
        {
            anchors.centerIn: parent
        }
    }

    Frame {
        centeredText: "Communication"
    }

    Frame {
        title: "Arbres de données"
        content: [
            "Objectif:",
            " Représenter modèles d'objets des applis créatives",
            "  Souvent arborescent",
            "  Quid des cas non-arborescents ?",
            " Rendre ces modèles accessibles par réseau",
            "  Protocoles: OSC, Minuit, OSCQuery...",
            "  Types: float, int, bool, string, vec<2 .. 4>, char, list",
            " Addressage comme OSC:",
            "  /foo/bar/pos.x"
        ]
    }

    Frame {
        centeredText: "Utilisation dans les environnements"
    }
    CodeFrame
    {
        title: "C++"
        code:
'auto& node = find_or_create_node(device, "/test/my_int");
auto address = node.create_address(val_type::INT);

node.set(access_mode_attribute{}, access_mode::GET);
node.set(bounding_mode_attribute{}, bounding_mode::FOLD);
node.set(domain_attribute{}, make_domain(2, 14));
node.set(description_attribute{}, "an integral value");

address->add_callback([] (const auto& val) {
    std::cout << val << " ";
  });

address->push_value(5678);'
    }
    CodeFrame
    {
        title: "openFrameworks"
        code:
            'ossia::Parameter<bool> _fill;
ossia::Parameter<ofColor> _color;
ossia::ParameterGroup _sizeParams;
...
_circleParams.setup(_parent_node, "circle");

_sizeParams.setup(_circleParams, "sizeParams");
_radius.setup(_sizeParams,"radius",10.,1.,100.);
_position.setup(_sizeParams,
                "position",
                ofVec2f(ofGetWidth() / 2, ofGetHeight() / 2),
                ofVec2f(0., 0.), // Min
                ofVec2f(ofGetWidth(), ofGetHeight())); // Max'
    }
    CodeFrame
    {
        title: "Python"
        code:
            '# create a node, create a tuple address and initialize it
tuple_node = local_device.add_node("/test/value/tuple")
tuple_address = tuple_node.create_address(
                    ossia.ValueType.Tuple)
tuple_value = ossia.Value([
    ossia.Value(44100),
    ossia.Value("test.wav"),
    ossia.Value(0.9)]
    )
tuple_address.push_value(tuple_value)

# attach a callback function to the boolean address
def bool_value_callback(v):
    print(v.get())
    bool_address.add_callback(bool_value_callback)'
    }
    CodeFrame
    {
        title: "Unity3D"
        code:
            'public class Foo : public MonoBehaviour
{
  [Ossia.Attribute]
  int foo;
}'
    }
    CodeFrame
    {
        title: "QML"
        code:
            "Item {
  Ossia.Node { name: 'test' }
  AngleSlider {
    // Reads and writes from /test/angle
    Ossia.Property on angle {
      min: -90
      max: 0
      bounding: Ossia.Context.Clip
    }
  }
}"
    }
    CodeFrame
    {
        title: "C"
        code:
            "
OSSIA_EXPORT
bool ossia_device_update_namespace(
         ossia_device_t device);

OSSIA_EXPORT
ossia_node_t ossia_device_get_root_node(
         ossia_device_t device);

OSSIA_EXPORT
const char* ossia_device_get_name(
         ossia_device_t node);

//// Node ////
OSSIA_EXPORT
ossia_node_t ossia_node_add_child(
         ossia_node_t node,
         const char * name);"
    }
    Frame {
        title: "PureData"
        Image {
            source: "file:images/examples/ossiapd.png"
            anchors.centerIn: parent
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            smooth: true
            mipmap: true
            antialiasing: true
        }
    }
    Frame {
        title: "Définition et utilisation d'un arbre"
        content: [
            "Manuellement dans le code",
            "Manuellement dans i-score",
            "Automatiquement via déclaration d'objets dans une application créative.",
            "Automatiquement via découverte réseau",
            "Automatiquement via des objets prédéfinis (MIDI).",
            "Via code QML. Utilité pour protocoles qui n'ont pas une structure arborescente évidente."
        ]
    }

    Frame {
        title: "Performances"

        DeviceChart { }
        // Performances de la communication réseau, par OSC.
        // Performances de la création / modification d'un arbre
        // Performances de la découverte automatique par OSCQuery, en local, en distant
    }

    Frame {
        title: "Démo: contrôle"
        PdClient { }
    }

    Frame {
        title: "OSCQuery"
        Oscquery { }
    }

    Frame {
        centeredText: "Modèle de temps"
    }

    Frame {
        title: "Objets: graphe temporel"
        Image {
            source: "file:images/iscore-example.png"
            anchors.centerIn: parent
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            smooth: true
            mipmap: true
            antialiasing: true
        }
    }
    Frame {
        title: "Objets: arbre hiérarchique"
        Row {
            anchors.fill: parent
            anchors.centerIn: parent
            Image {
                source: "file:images/score.png"
                height: parent.height
                fillMode: Image.PreserveAspectFit
                smooth: true
                mipmap: true
                antialiasing: true
            }

            Image {
                source: "file:images/hierarch-graph.png"
                fillMode: Image.PreserveAspectFit
                height: parent.height
                smooth: true
                mipmap: true
                antialiasing: true
            }
        }
    }

    Frame {
        title: "Interaction"
        content: [
            "Choix: interaction introduit un tic de décalage"
        ]
        Video {
            source: "images/exec1.mp4"
            autoLoad: true
            x: 50
            y: 100
            width: 410
            height: 216
            antialiasing: false
            smooth: false
            MouseArea {
                anchors.fill: parent
                onClicked: parent.play()
            }
        }
    }
    Frame {
        title: "Horloges"
        content: [
            "Unité de temps abstraite",
            " Ex.: A: 300, B: 5000",
            "Choix d'horloge définit les durées",
            " Travail en ms ou échantillons",
            " Choix par défaut fait dans i-score: ",
            "  Dates données en ms",
            "  Exécution calculée en us pour précision du ralenti"
        ]
    }
    Frame {
        title: "Live-coding"
        content: [
            "Réactivité dans la boucle d'exécution",
            " Communication inter-thread: commandes d'édition",
            " Évite overhead des mutex",
            "  pay for what you use"
        ]
    }
    Frame {
        title: "Live-coding"
        Image {
            source: "file:images/exec.png"
            fillMode: Image.PreserveAspectFit
            width: parent.width
            smooth: true
            mipmap: true
            antialiasing: true
        }
    }
    CodeFrame {
        title: "Live-coding"
        code:
"run():
  while(running):
    if(!paused)
      wait_enough_time()

      # Progression du temps dans les objets
      root.tick(time_increment)

      # Envoi messages réseaux
      launch(root.state())

      # Application modifications potentielles
      # size(edition_commands) rarement > 2
      while(!empty(edition_commands))
        command = pop(edition_commands)
        command()
    else
      sleep()
"
    }
    CodeFrame {
        title: "Live-coding"
        code:"
wait_enough_time():
  pause = granularity - elapsed % granularity

  # Déterminé expérimentalement pour garantir
  # l'absence d'over-sleep sur une machine moyenne
  while(pause > 5000)
    t1 = now()
    sleep(pause / 2)
    t2 = now()
    pause = pause - (t2 - t1)

  busy_wait(pause)

"
    }


    Frame {
        title: "Performances"
        ConstraintChart { }
        // Contraintes en série, en //, mélangé (avec différents pourcentages série / //
    }
    Frame {
        title: "Démo: temps"
        Photobooth {
        }
    }

    Frame {
        title: "Démo: live coding"
    }

    Frame {
        centeredText: "Modèles de données"
    }

    Frame {
        title: "Contrôle pur"
        Image {
            source: "file:images/hierarch-graph.png"
            fillMode: Image.PreserveAspectFit
            height: parent.height
            smooth: true
            mipmap: true
            antialiasing: true
        }
    }

    CodeFrame {
        title: "Contrôle pur: My First Process"
        titleColor: "#877"
        textColor: "#655"
        codeFontFamily: "Fira Code"
        code:
"class mon_process
 : public ossia::time_process
{
  public:
    mon_process(Destination d): m_dest{d} { }

    auto state(ossia::time_value date, double pos) override
      -> ossia::state_element
    {
      return ossia::message(m_dest, rand());
    }

  private:
    Destination m_dest;
};"
    }

    CodeFrame {
        title: "Contrôle pur: My First JS Process"
        titleColor: "#877"
        textColor: "#655"
        codeFontFamily: "Fira Code"
        code:
"function(t) {
  return {
    address: 'my:/address'
    value: Math.rand()
  };
}"
    }

    Frame {
        title: "Audio: avec la LibAudioStream"
        Image {
            source: "file:images/mixage.png"
            fillMode: Image.PreserveAspectFit
            width: parent.width
            smooth: true
            mipmap: true
            antialiasing: true
        }
    }

    Frame {
        title: "Espaces de données"
        content: [
            "Problématique: compositeurs travaillent avec quantités physiques",
            " Couleur: RGB, HSV, ...",
            " Position: cartésien, polaire...",
            "Fonctionnement: ",
            " Addresses étendues par accesseur:",
            " /foor/bar/baz@[color.hsv.h]",
            " Combinaison et conversion automatique selon l'ordre d'exécution"
        ]
    }

    Frame {
        title: "Espaces de données"

        AnimatedImage
        {
            source: "file:images/dataspace.gif"
            fillMode: Image.PreserveAspectFit
            width: parent.width
            smooth: true
            mipmap: true
            antialiasing: true
        }
    }

    Frame {
        title: "Généralisation: flots de données"

        QC.SwipeView {
            anchors.fill: parent

            Image
            {
                source: "file:images/flow1.png"
                fillMode: Image.PreserveAspectFit
                height: parent.height
                smooth: true
                mipmap: true
                antialiasing: true
            }

            Image
            {
                source: "file:images/flow2.png"
                fillMode: Image.PreserveAspectFit
                height: parent.height
                smooth: true
                mipmap: true
                antialiasing: true
            }

            Image
            {
                source: "file:images/flow3.png"
                fillMode: Image.PreserveAspectFit
                height: parent.height
                smooth: true
                mipmap: true
                antialiasing: true
            }
        }
    }

    Frame {
        title: "Démo: données"
        // TODO: avoir du pd qui transforme son en paramètre avec peek. Potentiellement sur tablette?. par ex. radius sphères.
        ScoreExample { }
    }


    Frame {
        centeredText: "Répartition"
    }
    Frame {
        title: "Arbre: que manque-t-il ?"
        Image {
            source: "file:images/current.png"
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
            height: parent.height
            smooth: true
            mipmap: true
            antialiasing: true
        }
    }
    Frame {
        title: "Arbre: que manque-t-il ?"
        Image {
            source: "file:images/objective.png"
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
            height: parent.height
            smooth: true
            mipmap: true
            antialiasing: true
        }
    }
    CodeFrame {
        title: "i-score as a library"
        code:
'Ossia.OSCQueryServer {
    id: dev
    name: "myDevice"
}

Ossia.Player {
    id: player
}

Component.onCompleted: {
    player.registerDevice(dev);
    player.load("my_score.scorejson")
    player.play()
}'
    }
    Frame {
        title: "Répartition"
        Image {
            source: "file:images/free.png"
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
            height: parent.height
            smooth: true
            mipmap: true
            antialiasing: true
        }
    }
    Frame {
        title: "Répartition"
        Image {
            source: "file:images/shared.png"
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
            height: parent.height
            smooth: true
            mipmap: true
            antialiasing: true
        }
    }

    Frame {
        title: "Démo: répartition"
    }
    Frame {
        title: "Conclusion"
        content: [
            "Ce qu'il manque:",
            " Live-coding réparti",
            " Échange de flux réparti au sein du graphe",
            " Symbolique pour répartition",
            "Mais aussi:",
            " Temps musical",
            " Support des types de données 2D / 3D : image, vidéo, shader, glTF..."
        ]
    }
    /*
    Frame {
        title: "Temps musical"
        content: [
            "Spécifications",
            " Live-coding réparti",
            " Échange de flux réparti au sein du graphe",
            " Temps musical"
        ]
    }
    */

}
