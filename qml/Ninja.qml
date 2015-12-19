import QtQuick 2.0
import VPlay 2.0

EntityBase {

    id: ninjaEntity
    entityType: "Ninja"
    state: isJumping === true ? "jump" : "run"

    property int currentWidth: 40
    property int currentHeight: 40
    property bool isJumping: false

    SpriteSequenceVPlay {
        id: ninjaAnimation
        anchors.centerIn: parent

        transform: Scale {
            id: scaleAnim
            origin.x: currentWidth / 2
            origin.y: currentHeight / 2
            xScale: 1
            yScale: 1
        }

        SpriteVPlay {
            name: "run"
            frameCount: 16
            frameRate: 30
            frameWidth: 40
            frameHeight: 40
            source: "../assets/img/ninja_run_sprite.png"
        }

        SpriteVPlay {
            name: "jump"
            frameCount: 10
            frameRate: 30
            frameWidth: 100
            frameHeight: 100
            source: "../assets/img/ninja_jump_sprite.png"
        }

        states: [
            State {
                name: "flip"
                PropertyChanges { target: scaleAnim; xScale: -1 }
            },
            State {
                name: "normal"
                PropertyChanges { target: scaleAnim; xScale: 1 }
            }
        ]
    }

    onStateChanged: {
        if (ninjaEntity.state == "run") {
            ninjaAnimation.jumpTo("run")
        }

        if (ninjaEntity.state == "jump") {
            ninjaAnimation.jumpTo("jump")
        }
    }

    BoxCollider {
      id: ninjaCollider

      width: 40
      height: 40
      anchors.centerIn: parent

      bodyType: Body.Dynamic

      gravityScale: 1

      fixture.onBeginContact: {
          if (isJumping === true) {
              state = "run"
              isJumping = false

              if (ninjaEntity.x < gameScene.width * 0.5) {
                  ninjaAnimation.state = "normal"
              } else {
                  ninjaAnimation.state = "flip"
              }
          }
      }
    }



    function jump() {
        if (isJumping === false) {
            isJumping = true

            ninjaAnimation.state = "normal"

            if (ninjaEntity.x < gameScene.width * 0.5) {
                ninjaCollider.body.applyForce(Qt.point(5, 0), Qt.point(0, 0))
                ninjaCollider.gravityScale = -1
            } else {
                ninjaCollider.body.applyForce(Qt.point(-5, 0), Qt.point(0, 0))
                ninjaCollider.gravityScale = 1
            }
        }
    }
}
