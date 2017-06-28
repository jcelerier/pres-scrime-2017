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


import QtQuick 2.5
import Qt.labs.presentation 1.0

Frame {
    id: slide;

    property string codeFontFamily: parent.codeFontFamily;
    property string code;
    property real codeFontSize: baseFontSize * 0.6;



    Rectangle {
        id: background
        anchors.fill: parent
        radius: height / 10;
        color: Qt.rgba(0.6,0.6,0.6,0.5)
        border.color: slide.textColor;
        border.width: height / 250;
    }

    onCodeChanged: {
        listModel.clear();
        var codeLines = slide.code.split("\n");
        for (var i=0; i<codeLines.length; ++i) {
            listModel.append({
                                line: i,
                                code: codeLines[i]
                             });
        }
    }

    ListModel {
        id: listModel
    }

    onVisibleChanged: {
        listView.focus = slide.visible;
        listView.currentIndex = -1;
    }

    ListView {
        id: listView;

        anchors.fill: parent;
        anchors.margins: background.radius / 2
        clip: true

        model: listModel;
        focus: true;

        MouseArea {
            anchors.fill: parent
            onClicked: {
                listView.focus = true;
                listView.currentIndex = listView.indexAt(mouse.x, mouse.y + listView.contentY);
            }

        }

        delegate: Item {

            id: itemDelegate

            height: lineLabel.height
            width: parent.width

            Rectangle {
                id: lineLabelBackground
                width: 40
                height: lineLabel.height;
                color: slide.textColor;
                opacity: 0.1;
            }

            Text {
                id: lineLabel
                anchors.right: lineLabelBackground.right;
                text: (line+1)
                width: 40
                color: slide.textColor;
                font.family: slide.codeFontFamily
                font.pixelSize: slide.codeFontSize
                font.bold: itemDelegate.ListView.isCurrentItem;
                opacity: itemDelegate.ListView.isCurrentItem ? 1 : 0.9;

            }

            Rectangle {
                id: lineContentBackground
                anchors.fill: lineContent;
                anchors.leftMargin:  -lineContent.height / 2;
                color: slide.textColor
                opacity: 0.2
                visible: itemDelegate.ListView.isCurrentItem;
            }

            Text {
                id: lineContent
                anchors.left: lineLabelBackground.right
                anchors.leftMargin: lineContent.height / 2;
                anchors.right: parent.right;
                color: slide.textColor;
                text: code;
                font.family: slide.codeFontFamily
                font.pixelSize: slide.codeFontSize
                font.bold: itemDelegate.ListView.isCurrentItem;
                opacity: itemDelegate.ListView.isCurrentItem ? 1 : 0.9;
            }
        }
    }



}
