import VPlay 2.0
import QtQuick 2.0
import "../common"

SceneBase {
    id: menuScene

    // signal indicating that the selectLevelScene should be displayed
    signal playPressed
    // signal indicating that the creditsScene should be displayed
    signal creditsPressed

    // menu background
    Image {
        source: "../../assets/img/menu_background.jpg"
        width: menuScene.width
        height: menuScene.height
        //anchors.left: 0
        //anchors.bottom: 0
    }

    // the "logo"
    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 30
        font.pixelSize: 30
        color: "#e9e9e9"
        text: "Ninrun"
    }

    // menu
    Column {
        anchors.centerIn: parent
        spacing: 10
        MenuButton {
            text: "Play"
            onClicked: {
                audioManager.play(audioManager.idClick)
                playPressed()
            }
        }
        MenuButton {
            text: "Credits"
            onClicked: creditsPressed()
        }
    }
}

