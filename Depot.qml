import QtQuick 2.0

Item {
    id: myDepot
     property double depotPosX
     property double depotPosY

    Image {
        id: image3
        x: depotPosX // 100//myDepot.x
        y: depotPosY // 100//myDepot.y
        width: 120
        height: 120
        source: "qrc:/Images/medkit.png" // Author knik1985 https://opengameart.org/content/medkit-0
    }

}
