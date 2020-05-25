#include <QtMath>
#include <QDebug>
#include "positionclass.h"

MyPositionClass::MyPositionClass()
{

}

void MyPositionClass::assignPlayerPosXY(double i, double playPosX, double playPosY)
{

    int intI = i;
    BotPosition["PlayerIks"] = playPosX;
    RotationsPositions[0][0] = playPosX;
    BotPosition["PlayerYgrek"] = playPosY;
    RotationsPositions[0][1] = playPosY;
}

void MyPositionClass::assignBotPosXY(int botNo, double boPosX, double boPosY)
{
        botPosX = boPosX;
        RotationsPositions[botNo][0] = boPosX;
        BotPosition["BotYgrek"] = boPosY;
        RotationsPositions[botNo][1] = boPosY;
}

void MyPositionClass::assignTargetXY(double tarX, double tarY)
{

        TargetPosition[0][0] = tarX;

        TargetPosition[0][1] = tarY;

}

void MyPositionClass::assignShooterPosXY(double tarX, double tarY)
{

        ShooterPosition[0][0] = tarX;

        ShooterPosition[0][1] = tarY;

}

void MyPositionClass::assignBulletXY(double bulX, double bulY)
{

        BulletPosition[0][0] = bulX;

        BulletPosition[0][1] = bulY;

}

void MyPositionClass::assignPlayerRot(double i, double playRot)
{
    int intI = i;
    RotationsPositions[0][2] = playRot;
}

void MyPositionClass::assignBotRot(int botNo, double boRot)
{
    RotationsPositions[botNo][2] = boRot;
}

void MyPositionClass::assignBulletRot(double bullRot)
{

        BulletRotation = bullRot;
}

void MyPositionClass::assignIteration(double it)
{
    iteration = it;
}

void MyPositionClass::assignCounter(double count)
{
    counter = count;
}

void MyPositionClass::assignBotNumber(int number)
{
    botNumber = 0;
    number = botNumber;
}

void MyPositionClass::assignBulletCounter(double count)
{
    bulletCounter = count;
}

double MyPositionClass::playerRotReturn(double it)
{
    int botOrPlayer = it;
    return RotationsPositions[botOrPlayer][2];
}

double MyPositionClass::botRotReturn(int botNo)
{
    return RotationsPositions[botNo][2];
}

double MyPositionClass::bulletRotReturn()
{
    return BulletRotation;
}

double MyPositionClass::playerPosXReturn()
{
    return RotationsPositions[0][0];
}

double MyPositionClass::playerPosYReturn()
{
    return RotationsPositions[0][1];
}

double MyPositionClass::botPosXReturn(int botNo)
{
    return RotationsPositions[botNo][0];
}

int MyPositionClass::botNoReturn()
{
    return botNumber;
}

double MyPositionClass::botPosYReturn(int botNo)
{
    return RotationsPositions[botNo][1];
}

double MyPositionClass::targetXReturn()
{
    return TargetPosition[0][0];
}

double MyPositionClass::targetYReturn()
{
    return TargetPosition[0][1];
}

double MyPositionClass::bulletXReturn()
{
    return BulletPosition[0][0];
}

double MyPositionClass::bulletYReturn()
{
    return BulletPosition[0][1];
}

double MyPositionClass::shooterPosXReturn()
{
    return ShooterPosition[0][0];
}

double MyPositionClass::shooterPosYReturn()
{
    return ShooterPosition[0][1];
}

double MyPositionClass::targetBotXReturn()
{
    return TargetedBotPosition[0][0];
}

double MyPositionClass::targetBotYReturn()
{
    return TargetedBotPosition[0][1];
}

void MyPositionClass::assignTargetedBotXY(double tarbX, double tarbY)
{
    TargetedBotPosition[0][0] = tarbX;
    TargetedBotPosition[0][1] = tarbY;
}

double MyPositionClass::returnIteration()
{
    return iteration;
}

double MyPositionClass::returnCounter()
{
    return counter;
}

double MyPositionClass::returnBulletCounter()
{
    return bulletCounter;
}

double MyPositionClass::vehicleField()
{
    double borderX = playerPosX + 10;
    return borderX;

}

double MyPositionClass::lengthX(double onePosX, double twoPosX)
{
    double lengthX = onePosX - twoPosX;
    botLengthX = lengthX;
    return botLengthX;

}

double MyPositionClass::lengthY(double onePosY, double twoPosY)
{
    double lengthY = onePosY - twoPosY;
    botLengthY = lengthY;
    return botLengthY;
}

double MyPositionClass::distance(double xLength, double yLength)
{
    double squares = (pow(xLength, 2) + pow(yLength, 2));
    double distance = sqrt(squares);
    myDistance = distance;
    return  myDistance;
}

double MyPositionClass::getAngle(double xLength, double yLength)
{
    double myAngle = atan2(yLength, xLength);
    myAngle = myAngle * (180/3.14);
    botAngle = myAngle;
    return botAngle;
}

double MyPositionClass::getBulletAngle(double xLength, double yLength)
{
    double myAngle = atan2(yLength, xLength);
    myAngle = myAngle * (3.14/180);
    return  myAngle;
}

double MyPositionClass::getLengthX(double i)
{
    int intI = i;
    if (intI == 0) { return playerLengthX; } else if (intI == 1) { return botLengthX; }

}

double MyPositionClass::getLengthY(double i)
{
    int intI = i;
    if (intI == 0) { return playerLengthY; } else if (intI == 1) { return botLengthY; }


}

double MyPositionClass::bullRot(double targX, double targY, double shootX, double shootY)
{
    double myLengthX = lengthX(shootX, targX);
    double myLengthY = lengthY(shootY, targY);
    double myRot = getAngle(myLengthX, myLengthY);
    double bulletRot = (myRot * (-1));
    BulletRotation = bulletRot;
    return bulletRot;
}

void MyPositionClass::calcBullPos(double shootX, double shootY, double direction)
{
    direction = BulletRotation;
    bullPosX = ((shootX) - (sin(direction))*4);
    bullPosY = ((shootY) - (cos(direction))*4);

}

void MyPositionClass::takeName()
{
    botPlayerName[0] = "Czolg1";
    botPlayerName[1] = "Czolg2";
}

QString MyPositionClass::returnName()
{
    return botPlayerName[0];
}

double MyPositionClass::returnBullPosX()
{
    return bullPosX;
}

double MyPositionClass::returnBullPosY()
{
    return bullPosY;
}

