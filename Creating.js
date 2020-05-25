.pragma library
.import QtQuick.LocalStorage 2.0 as Sql

function creat(someComponent, someField, someX, someY, someRot) {
      var component = Qt.createComponent(someComponent)
      var dynamicImage = component.createObject(someField, {"x": someX+50, "y": someY,
                                                    "rotation": someRot})

}

function scoreToString(someScore) {
    var myScore = Number.toString(someScore)
    return myScore
}

