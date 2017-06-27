/****************************************************************************
**
** Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the QML Presentation System.
**
** $QT_BEGIN_LICENSE:LGPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia.  For licensing terms and
** conditions see http://qt.digia.com/licensing.  For further information
** use the contact form at http://qt.digia.com/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Digia gives you certain additional
** rights.  These rights are described in the Digia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3.0 as published by the Free Software
** Foundation and appearing in the file LICENSE.GPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU General Public License version 3.0 requirements will be
** met: http://www.gnu.org/copyleft/gpl.html.
**
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick.Controls 2.1 as QC
import CreativeControls 1.0 as CC
import Ossia 1.0 as Ossia
import Qt.labs.presentation 1.0
import QtQuick 2.0


Presentation
{
    id: presentation

    width: 1280
    height: 720
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

        }
    }

    Frame {
        centeredText: "Communication"
    }

    Frame {
        title: "Arbres de données"
    }

    Frame {
        title: "Utilisation dans les environnements"
    }

    Frame {
        title: "Définition d'un arbre"
    }

    Frame {
        title: "Performances"

        // Performances de la communication réseau, par OSC.
        // Performances de la création / modification d'un arbre
        // Performances de la découverte automatique par OSCQuery, en local, en distant
    }

    Frame {
        title: "Démo: contrôle"
        PdClient {

        }

    }

    Frame {
        centeredText: "Modèles de temps"
    }

    Frame {
        title: "Objets"
    }
    Frame {
        title: "Interactivité"
    }
    Frame {
        title: "Performances"

        // Contraintes en série, en //, mélangé (avec différents pourcentages série / //
    }

    Frame {
        title: "Démo: temps"
    }

    Frame {
        title: "Slide {} Element"
        fontFamily: "Fira Sans"
        content: [
            "Bullet points",
            "Should be short",
            "And to the point",
            " Sub point",
            "  Sub Sub point",
            " Sub point"
        ]

    }

    Frame {
        centeredText: "Modèles de données"
    }

    Frame {
        title: "Contrôle pur"
    }
    Frame {
        title: "Interactivité"
    }
    Frame {
        title: "Espaces de données"
    }
    Frame {
        title: "Audio: avec la LibAudioStream"
    }
    Frame {
        title: "Généralisation: flots de données"
    }

    Frame {
        title: "Démo: données"
        // TODO: avoir du pd qui transforme son en paramètre. par ex. radius sphères.
        ScoreExample {
        }
    }


    Frame {
        centeredText: "Répartition"
    }
    Frame {
        title: "Arbre: que manque-t-il ?"
    }
    Frame {
        title: "i-score as a library"
    }
    Frame {
        title: "Répartition"
    }

    Frame {
        title: "Démo"
    }
    Frame {
        title: "Conclusion"
    }

    Component.onCompleted:
    {
    }

}
