import VPlay 2.0
import QtQuick 2.0
import "../common"
import "../"

SceneBase {
    id:gameScene
    enabled: invisible

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
}

