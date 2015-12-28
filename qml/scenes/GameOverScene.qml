import VPlay 2.0
import QtQuick 2.0
import "../common"

SceneBase {
    id:gameOverScene

    signal replay

    // background
    Rectangle {
        anchors.fill: parent.gameWindowAnchorItem
        color: "#c0392b"
    }

    // back button to leave scene
    MenuButton {
        text: "Home"
        // anchor the button to the gameWindowAnchorItem to be on the edge of the screen on any device
        anchors.right: gameOverScene.gameWindowAnchorItem.right
        anchors.rightMargin: 25
        anchors.bottom: gameOverScene.gameWindowAnchorItem.bottom
        anchors.bottomMargin: 30
        onClicked: backButtonPressed()
    }

    // credits
    Text {
        text: "Score: " + gameScene.totalScore
        color: "white"
        anchors.centerIn: parent
        font.pixelSize: 30
    }

    MenuButton {
        text: "Replay"
        // anchor the button to the gameWindowAnchorItem to be on the edge of the screen on any device
        anchors.left: gameOverScene.gameWindowAnchorItem.left
        anchors.leftMargin: 25
        anchors.bottom: gameOverScene.gameWindowAnchorItem.bottom
        anchors.bottomMargin: 30
        onClicked: replay()
    }
}

