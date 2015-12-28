import VPlay 2.0
import QtQuick 2.0
import "../common"
import "../"

SceneBase {
    id:gameScene

    enabled: invisible
    property int totalScore: ninja.totalScore

    PhysicsWorld {
        id: physicWorld
        debugDrawVisible: false // set this to false to hide the physics overlay
        updatesPerSecondForPhysics: 60
        gravity.x: -60 // how much gravity do you want?
    }

    // background
    Image {
        source: "../../assets/img/game_background.jpg"
        width: gameScene.width
        height: gameScene.height
    }

    Ninja {
        id: ninja
        x: 200
        y: 300
        onDie: {
            window.state = "gameOver"
        }
    }   

    Ground {
        id: leftGround1
        x: 0
    }

    Ground {
        id: leftGround2
        x: 0
        y: -gameScene.height
    }

    Ground {
        id: rightGround1
        x: gameScene.width - 20
    }

    Ground {
        id: rightGround2
        x: gameScene.width - 20
        y: -gameScene.height
    }

    Shuriken {
        id: shuriken1
        x: gameScene.width * 0.5
        y: -100
    }

    Shuriken {
        id: shuriken2
        x: gameScene.width * 0.5
        y: -gameScene.height * 0.5 - 100
    }

    MouseArea {
      anchors.fill: gameScene.gameWindowAnchorItem
      onPressed: {
        ninja.jump()
      }
    }

    // back button to leave scene
    MenuButton {
        text: "Back"
        // anchor the button to the gameWindowAnchorItem to be on the edge of the screen on any device
        anchors.right: gameScene.gameWindowAnchorItem.right
        anchors.rightMargin: 10
        anchors.top: gameScene.gameWindowAnchorItem.top
        anchors.topMargin: 10
        onClicked: {
            backButtonPressed()
        }
    }

    Text {
      id: scoreText
      x: 0
      y: 10
      text: "Score: " + ninja.totalScore
      font.pixelSize: 20
      color: "#ffffff"
    }

    function resetGame() {
        ninja.reset()
        shuriken1.reset()
        shuriken2.reset()
        shuriken2.y = -gameScene.height * 0.5 - 100
        totalScore = 0
    }
}

