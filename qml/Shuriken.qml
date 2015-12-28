import QtQuick 2.0
import VPlay 2.0

EntityBase {
    id: shuriken
    entityType: "Shuriken"

    property int maxY: 1000

    SpriteSequenceVPlay {
        id: shurikenAnimation
        //anchors.centerIn: parent

        SpriteVPlay {
            name: "idle"
            frameCount: 4
            frameRate: 30
            frameWidth: 60
            frameHeight: 60
            source: "../assets/img/shuriken.png"
        }
    }

    CircleCollider {
      id: collider
      radius: 30
      anchors.centerIn: parent

      fixedRotation: true
      bodyType: Body.Dynamic
      gravityScale: 0
      friction: 0

      body.linearVelocity: Qt.point(generateRandomValueBetween(50, 200),generateRandomValueBetween(150, 200))

      restitution: 1
    }

    function generateRandomValueBetween(minimum, maximum) {
        return Math.random()*(maximum-minimum) + minimum
    }

    function reset() {
        shuriken.x = gameScene.width * 0.5
        shuriken.y = -100
        maxY = generateRandomValueBetween(800, 1000)
        collider.body.linearVelocity = Qt.point(generateRandomValueBetween(50, 300),generateRandomValueBetween(150, 300))
    }

    onYChanged: {
        if (shuriken.y > maxY) {
            reset();
        }
    }
}
