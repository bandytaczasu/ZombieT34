.import QtQuick 2.2 as Source

function randNumGenerator() {

        var ran = (Math.random() * 50)
        var randX = Math.floor(Math.random() * Math.floor(1941));
        var randY = Math.floor(Math.random() * Math.floor(1211));
        return { randX : randX, randY : randY }
    }

function yCheckUp(y0) {
    if ((y0 < (5)) && y0 > (0))
            { return true }
    }

function yCheckDown(y0) {

    if ((y0 >= (1450)) && (y0 <= (1455)) )

            { return true }
    }

function xCheckLeft(x0) {
        if ((x0 < (5)) && (x0 > (0)))

            { return true }

    }

function xCheckRight(x0) {

    if ((x0 > (2700)) && (x0 < (2705)))
        { return true }
}

function rotYUpCheck(myRot) {

    if (((myRot <= (-90)) && myRot >= (-270)) ||
            (((myRot >= (90)) && myRot <= (270)))) {

        return true

    }
}

function rotYDownCheck(myRot) {

    if (!rotYUpCheck(myRot)) {

    if (((myRot <= (-270)) && !(myRot <= (-90))) ||
            !((myRot >= (90)) && myRot <= (270))) {
        return true

        }
    }
}


function rotXLeftCheck(myRot) {
    if (((myRot <= (-180)) && myRot < (0)) ||
            (((myRot >= (0)) && myRot < (180)))) {
        return true

    }
}

function rotXRightCheck(myRot) {
    if (!rotXLeftCheck(myRot)) {
    if (((myRot >= (-180)) && myRot < (0)) ||
            ((myRot >= (180)) && myRot < (360))) {
        return true
         }
    }
}

function collisionCheck (playerUpBord, playerLowBord, botUpBord, botLowBord) {

}

function angleComparison (myOneAngle, mySecondAngle, myThirdAngle) {
    var flagStraight = true; var flagLeft = false; var flagRight = false;
    var oneAngle = myOneAngle; var secondAngle = mySecondAngle;
    var thirdAngle = Math.abs(myThirdAngle)

    if ((secondAngle <= 90) && (secondAngle >= 0))
        { secondAngle += 180 }
    if ((secondAngle <= 0) && (secondAngle >= (-90)))
        { secondAngle += 90 }
    if ((secondAngle <= 180) && (secondAngle >= 90))
        { oneAngle -= 90 }
    if ((secondAngle <= (-90)) && (secondAngle > (-180)))
        {
        oneAngle -= 90 }

    if ((secondAngle <= 270) && (secondAngle > 180))
        { secondAngle -= 90 }

    if ((secondAngle <= (-180)) && (secondAngle >= (-90)))
        { oneAngle += 90 }

    if ((oneAngle) === (secondAngle)) { flagStraight = true; flagLeft = false; flagRight = false; }

    if ((oneAngle) < (secondAngle)) {
        if ((secondAngle-oneAngle) < (180) || (secondAngle-oneAngle) > (360)) {
        flagStraight = false; flagLeft = true; flagRight = false;
        } else if ((secondAngle-oneAngle) > (180) || (secondAngle-oneAngle) < (360)) {
        flagStraight = false; flagLeft = false; flagRight = true;
        }
    }
    if ((oneAngle) > (secondAngle)) {
        if ((oneAngle-secondAngle) < 180 || (oneAngle-secondAngle) > 360) {
        flagStraight = false; flagLeft = false; flagRight = true;
        } else if ((oneAngle-secondAngle) > 180  || (oneAngle-secondAngle) > 360) {
        flagStraight = false; flagLeft = true; flagRight = false;
        }
    }

    return { flagStraight : flagStraight, flagLeft : flagLeft, flagRight : flagRight }
}

