/*import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

ApplicationWindow {
    title: qsTr("Hello World")
    width: 640
    height: 480
    visible: true

    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: messageDialog.show(qsTr("Open action triggered"));
            }
            MenuItem {
                text: qsTr("E&xit")
                onTriggered: Qt.quit();
            }
        }
    }

    MainForm {
        anchors.fill: parent
        button1.onClicked: messageDialog.show(qsTr("Button 1 pressed"))
        button2.onClicked: messageDialog.show(qsTr("Button 2 pressed"))
        button3.onClicked: messageDialog.show(qsTr("Button 3 pressed"))
    }

    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }
}

*/

import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import "Movecheck.js" as MyCheck
import "Creating.js" as MyCreation

//@disable-check M16
ApplicationWindow {
    id: window

    width: 480

    height: 480
    visible: true

    property bool closed: false
    function myHit() {
        console.log("myHit")
    }

    Flickable {
            id: myViewWindow
            width: window.width
            height: window.height
            contentWidth: Screen.width*2
            contentHeight: Screen.height*2
            interactive: false
            boundsBehavior: Flickable.StopAtBounds


    //@disable-check M16
    Pole {
        id: pole
        mywidth: Screen.width*2
        myheight: Screen.height*2


    }

    //@disable-check M16

    Item {
        id: myItem
        property bool triggered: false
        property int score
        property int ammo: 20

    Vehicle {
        id: myName
        myfocus: true
        mywidth: 30
        visible: false
        botNo: 0
    }

    Vehicle {
        id: mytank1
        focus: false
        mywidth: 30
        visible: botVisible
        botNo: 1
        moveForward: botMoveForward;
        moveLeft: botMoveLeft;
        moveRight: botMoveRight;

        }

    Vehicle {
        id: mytank2
        focus: false
        mywidth: 30
        visible: botVisible
        botNo: 2
        moveForward: botMoveForward;
        moveLeft: botMoveLeft;
        moveRight: botMoveRight;

        }

    Vehicle {
        id: mytank3
        focus: false
        mywidth: 30
        visible: botVisible
        botNo: 3
        moveForward: botMoveForward;
        moveLeft: botMoveLeft;
        moveRight: botMoveRight;
        }

    Vehicle {
        id: mytank4
        focus: false
        mywidth: 30
        visible: botVisible
        botNo: 4
        moveForward: botMoveForward;
        moveLeft: botMoveLeft;
        moveRight: botMoveRight;
        }

    Vehicle {
        id: mytank5
        focus: false
        mywidth: 30
        visible: botVisible
        botNo: 5
        moveForward: botMoveForward;
        moveLeft: botMoveLeft;
        moveRight: botMoveRight;
        }

    Vehicle {
        id: mytank6
        focus: false
        mywidth: 30
        visible: botVisible
        botNo: 6
        moveForward: botMoveForward;
        moveLeft: botMoveLeft;
        moveRight: botMoveRight;
        }

    Depot {
        id: lifeAmmoDepot
        visible: false
    }

    Kula {
        id: mojaKula
        focus: false
        visible: false
        }
    }

    Lifebar {
        id: myDeathbar
        color: "red"
        visible: true
        x: 30
        y: 30
        }

    Lifebar {
        id: myLifebar
        color: "blue"
        visible: true
        x: 30
        y: 30
        }

        Text {
            id: welcomeText
            x: myViewWindow.contentX + 60
            y: myViewWindow.contentY + 80
            color: "yellow"
            font.italic: true
            font.pixelSize: 30
            text: qsTr("There is a zombie apocalypse
in the land of T-34.
Run from the undead vevicles,
shoot them if you have to.
Use the AWSD keys to drive,
shoot using the mouse.
Look for medpacks to replenish
your life and ammo.")
        }

        Text {
            id: scoreSign
            x: myViewWindow.contentX + 260
            y: myViewWindow.contentY + 20
            color: "yellow"
            font.italic: true
            font.pixelSize: 20
            text: "Score"
        }

        Text {
            id: myScore
            x: myViewWindow.contentX + 400
            y: myViewWindow.contentY + 20
            color: "yellow"
            font.italic: true
            font.pixelSize: 20
            text: myItem.score.toString()
        }

        Text {
            id: ammoSign
            x: myViewWindow.contentX + (190)
            y: myViewWindow.contentY + (window.height - 50)
            color: "yellow"
            font.italic: true
            font.pixelSize: 20
            text: myItem.ammo.toString()
        }

        Text {
            id: myAmmo
            x: myViewWindow.contentX + (50)
            y: myViewWindow.contentY + (window.height - 50)
            color: "yellow"
            font.italic: true
            font.pixelSize: 20
            text: qsTr("Ammo")
        }

        Button {
            id: startgame
            visible: true
            width: 60
            height: 20
            text: "Start"
            x: myViewWindow.contentX + 190;
            y: myViewWindow.contentY + 50
            enabled: true

            onClicked: {
                myItem.triggered = true
                welcomeText.visible = false
                startgame.visible = false
                startgame.enabled = false
            }
        }

    Text {
        id: endText
        font.italic: true
        font.pixelSize: 34
        color: "yellow"
        visible: false
        text: "Your tank is KAPUTT!!!"
     }

    Button {
        id: endgame
        text: "End"
        visible: false
        onClicked: {
            Qt.quit()
        }
    }

    Button {
        id: startnewgame
        text: "Start new game?"
        visible: false
        x: myViewWindow.contentX + 280
        y: myViewWindow.contentY + 50
        onClicked: {
            myItem.triggered = false
            myItem.score = 0
            myItem.ammo = 20
            lifeAmmoDepot.visible = false
            endgame.visible = false
            startnewgame.visible = false
            endText.visible = false
            welcomeText.visible = true
            startgame.visible = true
            startgame.enabled = true
            myLifebar.x = 30
            myLifebar.y = 30
            myDeathbar.x = 30
            myDeathbar.y = 30
          }
       }
    }
}
