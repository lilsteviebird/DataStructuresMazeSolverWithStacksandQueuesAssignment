//
//  ViewController.m
//  RealMazeSolver
//
//  Created by sli19 on 11/24/18.
//  Copyright © 2018 sli19. All rights reserved.
//

#import "ViewController.h"
#import "GameScene.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
    // including entities and graphs.
    GKScene *scene = [GKScene sceneWithFileNamed:@"GameScene"];
    
    // Get the SKScene from the loaded GKScene
    GameScene *sceneNode = (GameScene *)scene.rootNode;
    
    // Copy gameplay related content over to the scene
    sceneNode.entities = [scene.entities mutableCopy];
    sceneNode.graphs = [scene.graphs mutableCopy];
    
    // Set the scale mode to scale to fit the window
    sceneNode.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene
    [self.skView presentScene:sceneNode];
    
    self.skView.showsFPS = YES;
    self.skView.showsNodeCount = YES;
    
}

- (IBAction)startSolving:(id)sender {
    
    NewNode *startingNode = [[NewNode alloc] init];
    [startingNode setNewX:1];
    [startingNode setNewY:1];
    
    MazeSolver *myMazeSolver = [(GameScene *)self.skView.scene myMazeSolver];
    [myMazeSolver depthSearch:startingNode];
    
    self.currentNode = myMazeSolver.solvingStack.top;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(drawPath:) userInfo:nil repeats:YES];
}

- (void)drawPath:(NSTimer *)timer{
    
    SKShapeNode *b = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(self.skView.scene.size.width/8, self.skView.scene.size.height/8) cornerRadius:30 * 0.3];
    b.fillColor = [NSColor blueColor];
    b.position = CGPointMake((-self.skView.scene.size.width/2 + self.skView.scene.size.width/16
                              ) + (self.currentNode.curr.y * self.skView.scene.size.width/8),
                             (self.skView.scene.size.height/2 - self.skView.scene.size.width/22) - (self.currentNode.curr.x * self.skView.scene.size.height/8));
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.skView.scene addChild:b];
    });
    
    if (self.currentNode.next){
        self.currentNode = self.currentNode.next;
    }else{
        [self.timer invalidate];
    }
}

@end
