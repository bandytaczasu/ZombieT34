 import QtQuick 2.2
//import posclass 1.0
import "Moving.js" as MyFunct
import "Movecheck.js" as MyCheck
import "Creating.js" as MyCreation

Item {
    id: mytank

    property double iter
    property double counter
    property double newCounter
    property string tankanchor

    property bool myfocus
    property double mywidth
    property double myx
    property double myy
    property double botX
    property double botY
    property double playerX: 180
    property double playerY: 180
    property double positBotX
    property double positBotY
    property double targetTankX
    property double targetTankY
    property double botRotation
    property double playerRotation
    property bool botVisible: false
    property double bulletX
    property double bulletY
    property double depotX
    property double depotY
    property string score
    property string myId: image2
  //  property string myPole: pole
    property double myRotation: 0
    property bool moveForward: false
    property bool moveBackward: false
    property bool moveLeft: false
    property bool moveRight: false
    property bool botMoveLeft: false
    property bool botMoveRight: false
    property bool botMoveForward: true
    property bool botStopped: false
    property bool borderStop: false
    property double botNo
    property double lifebarWidth
    property bool myItemTriggered: myItem.triggered


    Component.onCompleted: {
        console.log("completed")
    }



    function getName() {
        myName = posit.returnName();
       console.log(myName);
    }

    Image {
        id: image2
        x: playerX
        y: playerY
        width: mytank.mywidth
        height: 60
        rotation: myRotation+90
        focus: mytank.myfocus
        source: "Images/T34_preview.png" // Author Bleed https://opengameart.org/content/tank-pack-bleeds-game-art

    }

        Keys.onPressed: {

            if ((event.key !== (Qt.Key_W || Qt.Key_A || Qt.Key_S || Qt.Key_D || Qt.Key_S || Qt.Key_Backspace)))
            { event.accepted = false }

            if (
                    (myItem.triggered === true) &&
                    (lifebarWidth != 0) && (lifebarWidth > 0))
            {

                if (event.key === Qt.Key_D) {

                    event.accepted = true;

                    moveRight = true
        }

                 if (event.key === Qt.Key_A) {   event.accepted = true;

                     moveLeft = true

                    }

                     if ((event.key === Qt.Key_W) && (lifebarWidth != 0))// && (lifebarWidth > 0))
                     {


                         event.accepted = true

                         moveForward = true

                     }
                         if ((event.key === Qt.Key_S) && (lifebarWidth != 0))// && (lifebarWidth > 0))
                         {

                             event.accepted = true

                             moveBackward = true
                         }
                         if (event.key === Qt.Key_Backspace) {

                             event.accepted = true

                             console.log("Backspace")
                         }
                }
        }


        Keys.onReleased: {
            if (event.key === Qt.Key_A) { moveLeft = false; }
            if (event.key === Qt.Key_D) { moveRight = false; }
            if (event.key === Qt.Key_W) { moveForward = false; }
            if (event.key === Qt.Key_S) { moveBackward = false; }

        }

        function endOfGame () {
            myName.moveForward = false;
            mojaKula.bulletMoveForward = false;
            mojaKula.bulletVisible = false
            endText.x = myViewWindow.contentX + 60
            endText.y = myViewWindow.contentY + 80
            endText.visible = true
            endgame.x = myViewWindow.contentX + 170
            endgame.y = myViewWindow.contentY + 50
            endgame.visible = true
            startnewgame.visible = true
            startnewgame.enabled = true

        }

        function respawning() {
            if (!(myItem.triggered === false) && (myTimer.running)) {
                var myrandX = MyCheck.randNumGenerator().randX
                var myrandY = MyCheck.randNumGenerator().randY
                image2.x = myrandX; image2.y = myrandY
                botX = image2.x; botY = image2.y;
                botVisible = true
            }
        }

        function flickableScreen() {
            if (myItemTriggered === true) {
            myViewWindow.contentY = (Math.min(myViewWindow.contentHeight-myViewWindow.height, Math.max(0, playerY-myViewWindow.height/2)))
            myViewWindow.contentX = (Math.min(myViewWindow.contentWidth-myViewWindow.width, Math.max(0, playerX-myViewWindow.width/2)))
            myDeathbar.x = myViewWindow.contentX + 30
            myDeathbar.y = myViewWindow.contentY + 30
            myLifebar.x = myViewWindow.contentX + 30
            myLifebar.y = myViewWindow.contentY + 30
            }
        }

        Timer {
            id: myTimer
            interval: 10;
            running: myItem.triggered
            repeat: true;
            onTriggered: {
               // score = Number.toString(image2.x)
              //  myItem.score = Number.toLocaleString(image2.rotation) //MyCreation.scoreToString(playerX)
              //  score = "Score"
              //  myItem.score = 12
                console.log(lifeAmmoDepot.depotPosX , lifeAmmoDepot.depotPosY)

                if (lifeAmmoDepot.visible === false) {
                    lifeAmmoDepot.depotPosX = MyCheck.randNumGenerator().randX
                    lifeAmmoDepot.depotPosY = MyCheck.randNumGenerator().randY
                    lifeAmmoDepot.visible = true
                }

                if (botNo === 0 && botNo <= 1) {
                    if ((MyFunct.hit(playerX, playerY, depotX+30, depotY+30) === true) && lifeAmmoDepot.visible === true) {
                        myLifebar.width = 100; myItem.ammo = 20; lifeAmmoDepot.visible = false;
                        console.log(" DEPOT", playerX, playerY, lifeAmmoDepot.x, lifeAmmoDepot.y)
                    } else {
                        myLifebar.width = myLifebar.width; myItem.ammo = myItem.ammo;
                    }
                }

                if (myItem.triggered === true) {

                if (myName.visible === false) {
                        if (botNo === 0) {
                            image2.x = 184; image2.y = 124;
                            image2.rotation = 90
                            myName.visible = true;
                            botMoveForward = true;

                        }
                    }

                if (startgame.pressed) { myTimer.running = true }

                if (startnewgame.pressed) {
                    myViewWindow.contentX = 0; myViewWindow.contentY = 0;
                  //  myDeathbar.x = myViewWindow.contentX + 30
                 //   myDeathbar.y = myViewWindow.contentY + 30
                //    myLifebar.x = myViewWindow.contentX + 30
                //    myLifebar.y = myViewWindow.contentY + 30
                    myTimer.running = false
                    myName.visible = false; myLifebar.width = lifebarWidth = 100;
                    botVisible = false;
                    posit.assignBotPosXY(0, playerX, playerY)
                    myName.focus = true
                  //  console.log(posit.playerPosXReturn())
                    if (myItem.triggered === true) { //console.log("Srartgame pressed");
                        myTimer.running = true
                    }
                }
                else { flickableScreen() }

                bulletX = posit.bulletXReturn();
                bulletY = posit.bulletYReturn();
                depotX = lifeAmmoDepot.depotPosX
                depotY = lifeAmmoDepot.depotPosY
                lifebarWidth = myLifebar.width

             /*   if (botNo === 0 && botNo <= 1) {
                    if ((MyFunct.hit(playerX, playerY, depotX, depotY) !== false) && lifeAmmoDepot.visible === true) {
                        myLifebar.width = 100; myItem.ammo = 20;// lifeAmmoDepot.visible = false;
                        console.log(" DEPOT", playerX, playerY, lifeAmmoDepot.x, lifeAmmoDepot.y)
                    } else {
                        myLifebar.width = myLifebar.width; myItem.ammo = myItem.ammo;
                    }
                }*/

                if (botNo != 0 && botNo >= 1) {

                    if ((myLifebar.width >=0) && (mojaKula.bulletMoveForward === true) && (mojaKula.bulletVisible === true)) {
                    if ((MyFunct.hit(positBotX, positBotY, bulletX, bulletY) === true)) {
                        botVisible = false; mojaKula.bulletMoveForward = false; mojaKula.visible = false
                        myItem.score += 100
                        }
                    }

                    if (MyFunct.hit(playerX, playerY, positBotX, positBotY) === true) { myLifebar.width = myLifebar.width - 1; //console.log(" collision", playerX, playerY, positBotX, positBotY)
                    }
                }
                if (myLifebar.width === 0) {
                    endOfGame();
                }

                posit.assignBotNumber(botNo)

                if ((!image2.focus) && (image2.visible === false)) {
                    respawning()
                }
                if (!image2.focus) {
                    (posit.assignBotPosXY(botNo, image2.x, image2.y))
                    posit.assignCounter(botNo)
                    } else if (image2.focus) {
                    posit.assignPlayerPosXY(iter, image2.x, image2.y)

                    if (moveBackward === true) {( myLifebar.width = myLifebar.width - 1)}
                }
                posit.assignIteration(iter)
                var myIter = (posit.returnIteration() + 1)
                if (myIter > 1) { myIter = 0 }
                var myNewCounter = counter;
                var myBotNo = botNo
                var myCounter = (posit.returnCounter())
                if (myCounter > 5) { myCounter = 1 }
                iter = myIter
                counter = myCounter
                playerX = posit.playerPosXReturn();
                playerY = posit.playerPosYReturn();
                 positBotX = posit.botPosXReturn(botNo);
                 positBotY = posit.botPosYReturn(botNo);
                botX =  posit.botPosXReturn(botNo);
                botY = posit.botPosYReturn(botNo);
                var playerIter = 0; var botIter = 1;
                var playerRot = posit.playerRotReturn(playerIter)
                var botRot = posit.botRotReturn(botNo)

                var myLengthX = posit.getLengthX(iter)
                var botLengthX = posit.lengthX(positBotX, playerX)
                var botLengthY = posit.lengthY(positBotY, playerY)
                var botAngle = posit.getAngle(botLengthX, botLengthY)

                if (!MyCheck.angleComparison(botAngle, posit.botRotReturn(botNo), posit.playerRotReturn(playerIter)).flagStraight) {

                    if (!MyCheck.angleComparison(posit.botRotReturn(botNo), botAngle).flagLeft) {

                        botMoveRight = false; botMoveLeft = true;// }

                    } else if (!MyCheck.angleComparison(posit.botRotReturn(botNo), botAngle).flagRight) {

                        botMoveLeft = false; botMoveRight = true;//w }
                    }
                } else
                if (MyCheck.angleComparison(posit.botRotReturn(botNo), botAngle).flagStraight) {
                    botMoveLeft = false; botMoveRight = false }

                if (moveForward === true) {
                                    var forRot = image2.rotation;
                                    var forX = image2.x;
                                    var forY = image2.y;
                                    var myCheckLeft =  (MyCheck.xCheckLeft(forX))
                                    var myCheckRight = (MyCheck.xCheckRight(forX))
                                    var myCheckUp =  (MyCheck.yCheckUp(forY))
                                    var myCheckDown = (MyCheck.yCheckDown(forY))
                                    var yTurnUp = MyCheck.rotYUpCheck(forRot);
                                    var yTurnDown = MyCheck.rotYDownCheck(forRot)
                                    var xTurnLeft = MyCheck.rotXLeftCheck(forRot);
                                    var xTurnRight = MyCheck.rotXRightCheck(forRot)
                                    var yTurnTable = [yTurnUp, yTurnDown]

                                    function borderYTurn(someYTurn) {
                                        return ( someYTurn ? ((MyFunct.noMove(forRot, forX, forY).posy)) :
                                                   ((MyFunct.advance(forRot, forX, forY).posy)))
                                    }

                                    function borderXTurn(someXTurn) {
                                        return ( someXTurn ? ((MyFunct.noMove(forRot, forX, forY).posx)) :
                                                   ((MyFunct.advance(forRot, forX, forY).posx)))
                                    }

                    if (!myCheckDown && !myCheckUp) {
                        image2.y = (MyFunct.advance(forRot, forX, forY).posy)
                                    } else

                                    if (!myCheckDown && myCheckUp) {
                                        image2.y = borderYTurn(yTurnUp)

                                    } else

                                    if (!myCheckUp && myCheckDown) {
                                        image2.y = borderYTurn(yTurnDown)
                                    }

                                    if (!myCheckLeft && !myCheckRight) {
                                        image2.x = (MyFunct.advance(forRot, forX, forY).posx)

                                            } else {

                                        if (!myCheckLeft && myCheckRight) {

                                            image2.x = borderXTurn(xTurnRight)

                                        } else

                                        if (!myCheckRight && myCheckLeft) {

                                            image2.x = borderXTurn(xTurnLeft)

                                        } else {
                                        }

                                    forRot = 0
                                    forX = 0
                                    forY = 0
                            }

                                    if (!(image2.focus)) {

                                        botX = image2.x
                                        botY = image2.y
                                        botRotation = image2.rotation


                                    } else if (image2.focus) {
                                        playerX = image2.x
                                        playerY = image2.y
                                        playerRotation = image2.rotation
                                    }

                             if (!image2.focus) { posit.assignBotPosXY(botNo, botX, botY);

                             posit.assignBotRot(botNo, botRotation)

                             } else
                              if (image2.focus) { posit.assignPlayerPosXY(iter, playerX, playerY)

                                  posit.assignPlayerRot(iter, playerRotation)

                             }
                }

            if (moveBackward === true) {
                var revRot = image2.rotation;
                var revX = image2.x;
                var revY = image2.y;
                image2.x = (MyFunct.reverse(revRot, revX, revY).posx)
                image2.y = (MyFunct.reverse(revRot, revX, revY).posy)

            }


            if (moveLeft === true) {
                var leftRot = image2.rotation;

                (image2.rotation = (MyFunct.left(leftRot)))
                leftRot = 0;
            }

            if (moveRight === true) {
                var rightRot = image2.rotation;

                (image2.rotation = (MyFunct.right(rightRot)))
                rightRot = 0;
            }

           if ((moveRight === false) && (moveBackward === false) && (moveForward === false) && (moveLeft === false)) {
               var nomovRot = image2.rotation;
               var nomovX = image2.x;
               var nomovY = image2.y;
               image2.x = (MyFunct.noMove(nomovRot, nomovX, nomovY).posx)
               image2.y = (MyFunct.noMove(nomovRot, nomovX, nomovY).posy)
                }

                }
             }
          }
}


