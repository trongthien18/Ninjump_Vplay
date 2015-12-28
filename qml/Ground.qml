import VPlay 2.0
import QtQuick 2.0

EntityBase {
  id: ground
  entityType: "Ground"
  width: 30
  height: gameScene.height
  scale: 0.5

  // BoxCollider responsible for collision detection
   BoxCollider {
    id: groundCollider
    //anchors.centerIn: parent
    x: 8
    width: parent.width - 16 // actual width is the same as the parent entity
     //height: parent.height - 20 // actual height is slightly smaller so the collision works smoother
     bodyType: Body.Static // only Dynamic bodies can collide with each other
     //collisionTestingOnlyMode: true // collisions are detected, but no physics are applied to the colliding bodies
   }

   Grid {
       id: grid1
       //anchors.centerIn: parent
       spacing: 0
       columns: 1

       Repeater {
           model: 10
           Image {
               source: "../assets/img/ground.png"
           }
       }
   }

   MovementAnimation {
     id: animation
     target: parent
     property: "y"
     velocity: 220
     running: true
   }

   onYChanged: {
       if (ground.y >= gameScene.height)
           ground.y = -gameScene.height
   }

}
