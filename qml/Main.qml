import VPlay 2.0
import QtQuick 2.0
import "scenes"
import "common"

GameWindow {
    id: window
    width: 640
    height: 960

    // You get free licenseKeys from http://v-play.net/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the V-Play Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from http://v-play.net/licenseKey>"

    // create and remove entities at runtime
    EntityManager {
        id: entityManager
    }

    // global music and sound management
    AudioManager {
      id: audioManager
    }

    // menu scene
    MenuScene {
        id: menuScene
        // listen to the button signals of the scene and change the state according to it
        onPlayPressed: {
            audioManager.play(audioManager.idClick)
            gameScene.resetGame()
            window.state = "game"
        }
        onCreditsPressed: {
            audioManager.play(audioManager.idClick)
            window.state = "credits"
        }
        // the menu scene is our start scene, so if back is pressed there we ask the user if he wants to quit the application
        onBackButtonPressed: {
            audioManager.play(audioManager.idClick)
            nativeUtils.displayMessageBox(qsTr("Really quit the game?"), "", 2);
        }
        // listen to the return value of the MessageBox
        Connections {
            target: nativeUtils
            onMessageBoxFinished: {
                // only quit, if the activeScene is menuScene - the messageBox might also get opened from other scenes in your code
                if(accepted && window.activeScene === menuScene)
                    Qt.quit()
            }
        }
    }

    // credits scene
    CreditsScene {
        id: creditsScene
        onBackButtonPressed: {
            audioManager.play(audioManager.idClick)
            window.state = "menu"
        }
    }

    // game scene to play a level
    GameScene {
        id: gameScene
        onBackButtonPressed: {
            audioManager.play(audioManager.idClick)
            window.state = "menu"
        }
    }

    GameOverScene {
        id: gameOverScene
        onBackButtonPressed: {
            audioManager.play(audioManager.idClick)
            window.state = "menu"
        }
        onReplay: {
            audioManager.play(audioManager.idClick)
            window.state = "game"
            gameScene.resetGame()
        }
    }

    // menuScene is our first scene, so set the state to menu initially
    state: "menu"
    activeScene: menuScene

    // state machine, takes care reversing the PropertyChanges when changing the state, like changing the opacity back to 0
    states: [
        State {
            name: "menu"
            PropertyChanges {target: menuScene; opacity: 1}
            PropertyChanges {target: window; activeScene: menuScene}
            StateChangeScript {
              script: {
                audioManager.playMusic(audioManager.idMusicBGMenu)
              }
            }
        },        
        State {
            name: "credits"
            PropertyChanges {target: creditsScene; opacity: 1}
            PropertyChanges {target: window; activeScene: creditsScene}
        },
        State {
            name: "game"
            PropertyChanges {target: gameScene; opacity: 1}
            PropertyChanges {target: window; activeScene: gameScene}
            StateChangeScript {
              script: {
                audioManager.playMusic(audioManager.idMusicBGGame)
              }
            }
        },
        State {
            name: "gameOver"
            PropertyChanges {target: gameOverScene; opacity: 1}
            PropertyChanges {target: window; activeScene: gameOverScene}
            StateChangeScript {
              script: {
                audioManager.playMusic(audioManager.idMusicBGMenu)
              }
            }
        }

    ]
}

