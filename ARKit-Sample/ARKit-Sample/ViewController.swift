//
//  ViewController.swift
//  ARKit-Sample
//
//  Created by SubaruShiozaki on 2019-05-21.
//  Copyright © 2019 Kazuya Takahashi. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
  
  @IBOutlet var sceneView: ARSCNView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Set the view's delegate
    sceneView.delegate = self
    
    // Show statistics such as fps and timing information
    sceneView.showsStatistics = true
    
    // light
    sceneView.autoenablesDefaultLighting = true
    
    sceneView.debugOptions = [.showWorldOrigin]
    
    
    //        // Create a new scene
    //        let scene = SCNScene(named: "art.scnassets/ship.scn")!
    //
    //        // Set the scene to the view
    //        sceneView.scene = scene
  }
  
  func drawSphereOrigin() {
    // SCNNode
    let sphere = SCNNode(geometry: SCNSphere(radius: 0.05))
    
    // set color of Sphere
    sphere.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
    sphere.geometry?.firstMaterial?.specular.contents = UIColor.white
    
    // position
    sphere.position = SCNVector3(0, 0, 0)
    
    // add as ChildNote to the Scene's rootNode
    sceneView.scene.rootNode.addChildNode(sphere)
    
    // angle -> radians
    let rotate = SCNAction.rotate(by: 2 * .pi, around: SCNVector3(0, 1, 0), duration: 5)
    sphere.runAction(SCNAction.repeatForever(rotate))
    
  }
  
  func movingSpaceShip() {
    // Create a new scene
    let scene = SCNScene(named: "art.scnassets/ship.scn")!
    
    let spaceShip = (scene.rootNode.childNode(withName: "ship", recursively: false))
    spaceShip?.position = SCNVector3(0.2, 0, 0)
    spaceShip?.scale = SCNVector3(0.2, 0.2, 0.2)
    
    spaceShip?.eulerAngles.y = .pi
    
    // Set the scene to the view
    sphere.addChildNode(spaceShip)
  }
  
  func drawCarnival() {
    let plane = SCNNode(geometry: SCNPlane(width: 0.6, height: 0.4))
    plane.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "carnival")
    plane.geometry?.firstMaterial?.isDoubleSided = true
    plane.position = SCNVector3(1, 0, -2)
    sceneView.scene.rootNode.addChildNode(plane)
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // Create a session configuration
    let configuration = ARWorldTrackingConfiguration()
    
    // Run the view's session
    sceneView.session.run(configuration)
    drawSphereOrigin()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    // Pause the view's session
    sceneView.session.pause()
  }
}
