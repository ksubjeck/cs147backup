//
//  ViewController.swift
//  vTag
//
//  Created by Austin-Caleb Flores on 11/20/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    var nodeModel:SCNNode!
    let nodeName = "ARTag"
    
    var nodeModelChild:SCNNode!
    var newtag = true;
    var finalTransform: simd_float4x4?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        SharedData.sharedDataInstance.loadTags();
        SharedData.sharedDataInstance.loadContacts();
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        //sceneView.debugOptions = ARSCNDebugOptions.showWorldOrigin
        //sceneView.debugOptions = ARSCNDebugOptions.showFeaturePoints
        sceneView.antialiasingMode = .multisampling4X
        
        
        
        // Create a new scene
        //let scene = SCNScene(named: "art.scnassets/ship.scn")!
        let scene = SCNScene();
        
        // Set the scene to the view
        sceneView.scene = scene
        
        let tagScene = SCNScene(named: "art.scnassets/collada/collada.dae")!
        nodeModel = tagScene.rootNode.childNode(withName: nodeName, recursively: true);
        
    }
    
    
    /**
     *When user touches the screen
    */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: sceneView);
        
        //Checks if tag was pressed
        var hitTestOptions = [SCNHitTestOption: Any]()
        hitTestOptions[SCNHitTestOption.boundingBoxOnly] = true
        let hitResults: [SCNHitTestResult]  = sceneView.hitTest(location, options: hitTestOptions)
        if let hit = hitResults.first {
            newtag = false; //Touching an existing tag
            if let node = getParent(hit.node) {
                nodeModelChild = node;
                //node.removeFromParentNode() //removes node here and now
                performSegue(withIdentifier: "ExploreModally", sender: nil)
                return
            }
        }
        
        //Wants to add a tag and rotate to face you
        let hitResultsFeaturePoints: [ARHitTestResult] =
            sceneView.hitTest(location, types: .featurePoint)
        if let hit = hitResultsFeaturePoints.first {
            newtag = true;
            // Get a transformation matrix with the euler angle of the camera
            let rotate = simd_float4x4(SCNMatrix4MakeRotation(sceneView.session.currentFrame!.camera.eulerAngles.y, 0, 1, 0))
            
            // Combine both transformation matrices
            finalTransform = simd_mul(hit.worldTransform, rotate)
            performSegue(withIdentifier: "ExploreModally", sender: nil)
        }
    }
    
    
    /**
    * Uses recursion to find parent node
    */
    func getParent(_ nodeFound: SCNNode?) -> SCNNode? {
        if let node = nodeFound {
            if node.name == nodeName {
                return node
            } else if let parent = node.parent {
                return getParent(parent)
            }
        }
        return nil
    }
    
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        if !anchor.isKind(of: ARPlaneAnchor.self) {
            DispatchQueue.main.async {
                let modelClone = self.nodeModel.clone()
                modelClone.position = SCNVector3Zero
                
                // Add model as a child of the node
                node.addChildNode(modelClone)
            }
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal;
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    

    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    func placeObject(){
        sceneView.session.add(anchor: ARAnchor(transform: finalTransform!))
    }
    
    func deletingObject(){
       nodeModelChild.removeFromParentNode()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ExploreModally"){
            guard let destinationViewController = segue.destination as? ExploreMenuWithPopup else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            destinationViewController.newTag = newtag;
            
        }
    }
    
}
