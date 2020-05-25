import QtQuick 2.0
import "Moving.js" as MyFunct
import "Movecheck.js" as MyCheck

Item {
    id: myBullet

    property double bulletX
    property double bulletY
    property double targetMouseX
    property double targetMouseY
    property bool bulletVisible
    property bool bulletMoveForward: false
    property double bulletCounter: 0
    property double assignBulletCounter
    property double bulletRotation

    Image {
        id: image1
        x: myBullet.bulletX
        y: myBullet.bulletY
      //  width: 60
       // height: 60
        source: "Images/expl_01_0003.png" // Author chabull https://opengameart.org/content/explosions-0
    }

    Timer {
        id: bulletTimer
        interval: 10;
        running: true;
        repeat: true;
        onTriggered: {
            var myBotNo = posit.botNoReturn()
            if (bulletMoveForward === true) {
                (posit.assignBulletCounter(bulletCounter+1))
                var myBulletCounter = (posit.returnBulletCounter())
                bulletCounter = myBulletCounter
                targetMouseX = posit.targetXReturn();
                targetMouseY = posit.targetYReturn();
                bulletRotation = posit.bulletRotReturn();
                posit.calcBullPos(bulletX, bulletY, bulletRotation)

                    mojaKula.bulletX = (MyFunct.bulletAdvance(targetMouseX, targetMouseY, bulletX, bulletY, bulletRotation).bulletPosX);
                    mojaKula.bulletY = (MyFunct.bulletAdvance(targetMouseX, targetMouseY, bulletX, bulletY, bulletRotation).bulletPosY);

                    var myBulRot = mojaKula.bulletRotation
                    mojaKula.visible = true
                    posit.assignBulletXY(mojaKula.bulletX, mojaKula.bulletY)

                if ((MyCheck.xCheckLeft(bulletX)===true) || (MyCheck.xCheckRight(bulletX)===true) ||
                        (MyCheck.yCheckDown(bulletY)===true) || (MyCheck.yCheckUp(bulletY)===true)) {
                    mojaKula.bulletMoveForward = false; mojaKula.visible = false
                } else if ((MyCheck.xCheckLeft(bulletX)===false) || (MyCheck.xCheckRight(bulletX)===false) ||
                            (MyCheck.yCheckDown(bulletY)===false) || (MyCheck.yCheckUp(bulletY)===false)) {
                        mojaKula.bulletMoveForward = true
                   }
                }
            }
        }
}
