import QtQuick 2.0
import "Moving.js" as MyFunct
import "Movecheck.js" as MyCheck

Item {
    id: mypole    
    anchors.fill: window.right
    property int mywidth
    property int myheight
    property bool klicked: false
    focus: true

    Image {
        id: mypole1
        x: 0
        y: 0
        source: "Images/Pole.jpg" // Author arikel https://opengameart.org/node/10178
        width: mypole.mywidth
        height: mypole.myheight
        visible: true               

        MouseArea {

            anchors.fill: parent
            onClicked: {
                if ((mouse.button == Qt.LeftButton) && (myLifebar.width >  0) && (myItem.ammo > 0))
                {
                    mojaKula.bulletMoveForward = true; mojaKula.bulletVisible = true; myItem.ammo -= 1;
                } else if (((mouse.button == Qt.LeftButton) && (myLifebar.width === 0)) || (myItem.ammo === 0))
                {
                    mojaKula.bulletMoveForward = false; mojaKula.visible = false }

                    var shooterPosX = posit.playerPosXReturn();
                    var shooterPosY = posit.playerPosYReturn();
                    var lengthX = (shooterPosX + mouse.x)
                    var lengthY = (shooterPosY + mouse.y)
                    posit.assignTargetXY(mouse.x, mouse.y)
                    posit.assignBulletXY(shooterPosX, shooterPosY)
                    mojaKula.bulletRotation = posit.bullRot(mouse.x, mouse.y, shooterPosX, shooterPosY)
                    mojaKula.bulletX = shooterPosX
                    mojaKula.bulletY = shooterPosY
                    mojaKula.targetMouseX = mouse.x
                    mojaKula.targetMouseY = mouse.y
            }
        }
     }
}
