import VPlay 2.0
import QtQuick 2.0
import QtMultimedia 5.0

Item {
  id: audioManager

  // Use Sound IDs to play Sounds e.g. audioManager.play(audioManager.idBADCORN)
  property int idClick: 11
  property int idFail: 22
  property int idFoodStep: 33
  property int idJump: 44

  // Use Music IDs to play Music. e.g. audioManager.playMusic(audioManager.idMusicBG)
  property int idMusicBGMenu: 111
  property int idMusicBGGame: 222

  function play(clipID) {

    switch(clipID) {
    case idClick:
      clipClick.play()
      break
    case idFail:
      clipFail.play()
      break
    case idFoodStep:
      clipFoodStep.play()
      break
    case idJump:
      clipJump.play()
      break
    }
  }

  function playMusic(trackID) {

    switch(trackID) {
    case idMusicBGMenu:
      music.source = "../../assets/sound/bgmMenu.wav"
      break
    case idMusicBGGame:
      music.source = "../../assets/sound/bgmGame.wav"
      break
    }

    music.play()
  }

  function stopMusic() {
    music.stop()
  }

  BackgroundMusic {
    id: music
  }

  Audio {
    id: clipClick
    source: "../../assets/sound/click.wav"
    volume: 1
  }
  Audio {
    id: clipFail
    source: "../../assets/sound/fall.wav"
    volume: 0.8
  }
  Audio {
    id: clipFoodStep
    source: "../../assets/sound/footstep.wav"
    volume: 1
  }
  Audio {
    id: clipJump
    source: "../../assets/sound/jump3.wav"
    volume: 1
  }

  Component.onCompleted: {
    playMusic(idMusicBG)
  }
}
