import QtQuick 2.0
import VPlay 2.0

// gets used for the Play button in MainScene and for the Continue button in GameOverScene
Image {
  id: imageButton

  // width & height must get set from outside, these are the default values!
  width: 140
  height: 30
  source: "../assets/button.png"



  property alias text: buttonText.text
  property alias textColor: buttonText.color
  property alias textSize: buttonText.font.pixelSize
  property alias textItem: buttonText
  property alias font: buttonText.font

  signal clicked

  Text {
    id: buttonText
    anchors.centerIn: parent
    font.pixelSize: 20
    color: "#f5b68a"

    font.family: fontHUD.name
  }

  MouseArea {
    id: mouseArea
    anchors.fill: parent
    hoverEnabled: true
    onClicked: {
      imageButton.scale = 1.0
      imageButton.clicked()
    }
    onPressed: {
      imageButton.scale = 0.85
    }
    onReleased: {
      imageButton.scale = 1.0
    }
    onCanceled: {
      imageButton.scale = 1.0
    }
  }
}
