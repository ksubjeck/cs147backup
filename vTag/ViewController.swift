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
    let nodeName = "ship"
    
    var nodeModelChild:SCNNode!
    var completed = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        
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
        
        let tagScene = SCNScene(named: "art.scnassets/ship.scn")!
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
            nodeModelChild = getParent(hit.node)
            //if let node = getParent(hit.node) {
                
                
                
                
                //node.removeFromParentNode() //TODO: if we comment this out and touch a tag in the world, does it stay there? IF yes, good.
                return
            //}
        }
        
        //Wants to add a tag and rotate to face you
        let hitResultsFeaturePoints: [ARHitTestResult] =
            sceneView.hitTest(location, types: .featurePoint)
        if let hit = hitResultsFeaturePoints.first {
            // Get a transformation matrix with the euler angle of the camera
            let rotate = simd_float4x4(SCNMatrix4MakeRotation(sceneView.session.currentFrame!.camera.eulerAngles.y, 0, 1, 0))
            
            // Combine both transformation matrices
            let finalTransform = simd_mul(hit.worldTransform, rotate)
            
            // Use the resulting matrix to position the anchor
            sceneView.session.add(anchor: ARAnchor(transform: finalTransform))
            // sceneView.session.add(anchor: ARAnchor(transform: hit.worldTransform))
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
        // Run the view's session
        sceneView.session.run(configuration)
        
        if (completed && nodeModelChild != nil) {
            nodeModelChild.removeFromParentNode()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    
    
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
