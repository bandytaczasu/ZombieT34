.import QtQuick 2.2 as Source

function returnBulletRot(myRot)
{
    var constantRot = myRot
    console.log("constantrot", constantRot)
    return constantRot
}

function noMove(rot, posx, posy) {

    return { rot : rot, posx : posx, posy : posy }
}

function advance(rot, posx, posy) {

    var oldPosX = posx
    var oldPosY = posy

    var lengthX = posx - oldPosX
    var lengthY = posy - oldPosY

    var posrotation = ((rot) * (-1))

    posrotation = (posrotation * (Math.PI/180))

    posx = (((posx) + (Math.sin(posrotation))*2))
    posy = (((posy) + (Math.cos(posrotation))*2))
    posrotation = 0

    return { posx : posx, posy : posy };

}

function reverse(rot, posx, posy) {

    var posrotation = ((rot) * (-1))

    posrotation = (posrotation * (Math.PI/180))

    posx = (((posx) - (Math.sin(posrotation))/2))
    posy = (((posy) - (Math.cos(posrotation))/2))

    posrotation = 0

    return { posx : posx, posy : posy };

}

function left(rot, turn) {

    var rotation = rot   
    rot = 0
    for (var i = 0.0; i <= 0.1; i++) {
    rotation = ((rotation - 5))

    if (rotation === (360) || (rotation === (-360))) {
         rotation = 0
    }

    rotation = Math.ceil(rotation)
    }

     return rotation
}

function right(rot, turn) {

    var rotation = rot
    rot = 0

    for (var i = 0.0; i <=0.1; i++) {
    rotation = ((rotation + 5))
    if (rotation === 360) {
         rotation = 0
    }

    rotation = Math.ceil(rotation)
    }

     return rotation
}

function bulletAdvance(targetx, targety, shooterx, shootery, bulRot) {

    var newBulRot = bulRot*(-1)

    var lengthX = (shooterx -  targetx)
    var lengthY = (shootery - targety)

    var newRot = (Math.atan2((lengthY), (lengthX)))
    var posrotation = ((newBulRot) * (1))

    posrotation = ((posrotation * (Math.PI/180)))

    var bulletPosX = (((shooterx) - (Math.cos(posrotation))*10))
    var bulletPosY = (((shootery) - (Math.sin(posrotation))*10))

    return { bulletPosX : bulletPosX, bulletPosY : bulletPosY, posrotation : posrotation }

}

function getBulletRot(targetx, targety, shooterx, shootery)
{
    var lengthX = shooterx -  targetx
    var lengthY = shootery - targety

    var newRot = Math.atan2(lengthY, lengthX)

    var posrotation = ((newRot) * (-1))

    posrotation = ((posrotation * (180/Math.PI)))

    console.log("secondposrot", posrotation)
    return posrotation
}

function hit(enemyx, enemyy, bulletx, bullety)
{
    var lengthX = (enemyx -  bulletx)
    var lengthY = (enemyy - bullety)
    var bulletHit
    if ((Math.abs(lengthX) <= 30) && (Math.abs(lengthX) >= 0)
            && (Math.abs(lengthY) <= 30) && (Math.abs(lengthY) >= 0)) {
        return true
    } else if ((Math.abs(lengthX) > 30) && (Math.abs(lengthY) > 30)) {
        return false
    }

}



