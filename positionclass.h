#ifndef POSITIONCLASS_H
#define POSITIONCLASS_H

#include <QObject>
#include <QMap>
#include <QVector>

class MyPositionClass : public QObject
{
    Q_OBJECT

private:
    double playerPosX;
    double playerPosY;
    double botPosX;
    double botPosY;
    double bullPosX;
    double bullPosY;
    double playerRot;
    double botRot;
    double RotationsPositions[8][3];
    double TargetPosition[1][2];
    double BulletPosition[1][2];
    double ShooterPosition[1][2];
    double TargetedBotPosition[1][2];
    double BulletRotation;
    double iteration;
    double counter;
    double bulletCounter;
    double playerLengthX;
    double playerLengthY;
    double botLengthX;
    double botLengthY;
    double playerAngle;
    double botAngle;
    double myDistance;
    int botNumber;
    QVector<QString> botPlayerName;
    QMap<QString, double> BotPosition;

public:
    MyPositionClass();
    Q_INVOKABLE void assignPlayerPosXY(double i, double playPosX, double playPosY);
    Q_INVOKABLE void assignBotPosXY(int botNo, double boPosX, double boPosY);
    Q_INVOKABLE void assignPlayerRot(double i, double playRot);
    Q_INVOKABLE void assignBotRot(int botNo, double boRot);
    Q_INVOKABLE void assignBulletRot(double bullRot);
    Q_INVOKABLE void assignTargetXY(double tarX, double tarY);
    Q_INVOKABLE void assignBulletXY(double tarX, double tarY);
    Q_INVOKABLE void assignShooterPosXY(double tarX, double tarY);
    Q_INVOKABLE void assignTargetedBotXY(double tarbX, double tarbY);
    Q_INVOKABLE void assignIteration(double it);
    Q_INVOKABLE void assignCounter(double count);
    Q_INVOKABLE void assignBulletCounter(double count);
    Q_INVOKABLE void assignBotNumber(int number);
    Q_INVOKABLE double playerRotReturn(double it);
    Q_INVOKABLE double botRotReturn(int botNo);
    Q_INVOKABLE double bulletRotReturn();
    Q_INVOKABLE double playerPosXReturn();
    Q_INVOKABLE double playerPosYReturn();
    Q_INVOKABLE double botPosXReturn(int botNo);
    Q_INVOKABLE double botPosYReturn(int botNo);
    Q_INVOKABLE int botNoReturn();
    Q_INVOKABLE double targetXReturn();
    Q_INVOKABLE double targetYReturn();
    Q_INVOKABLE double bulletXReturn();
    Q_INVOKABLE double bulletYReturn();
    Q_INVOKABLE double targetBotXReturn();
    Q_INVOKABLE double targetBotYReturn();
    Q_INVOKABLE double shooterPosXReturn();
    Q_INVOKABLE double shooterPosYReturn();
    Q_INVOKABLE double returnIteration();
    Q_INVOKABLE double returnCounter();
    Q_INVOKABLE double returnBulletCounter();
    Q_INVOKABLE double vehicleField();
    Q_INVOKABLE double lengthX(double onePosX, double twoPosX);
    Q_INVOKABLE double lengthY(double onePosY, double twoPosY);
    Q_INVOKABLE double distance(double xLength, double yLength);
    Q_INVOKABLE double getAngle(double xLength, double yLength);
    Q_INVOKABLE double getBulletAngle(double xLength, double yLength);
    Q_INVOKABLE double bullRot(double targX, double targY, double shootX, double shootY);
    Q_INVOKABLE void calcBullPos(double shootX, double shootY, double direction);
    Q_INVOKABLE double getLengthX(double i);
    Q_INVOKABLE double getLengthY(double i);
    Q_INVOKABLE double returnBullPosX();
    Q_INVOKABLE double returnBullPosY();

    Q_INVOKABLE void takeName();
    Q_INVOKABLE QString returnName();
};

#endif // POSITIONCLASS_H
