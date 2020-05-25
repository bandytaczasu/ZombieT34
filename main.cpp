#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QScopedPointer>

#include "positionclass.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QScopedPointer<MyPositionClass>posit(new MyPositionClass);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    engine.rootContext()->setContextProperty("posit", posit.data());

    return app.exec();
}
