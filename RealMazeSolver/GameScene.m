//
//  GameScene.m
//  RealMazeSolver
//
//  Created by sli19 on 11/24/18.
//  Copyright © 2018 sli19. All rights reserved.
//

#import "GameScene.h"
#import "Maze.h"
#import "NewNode.h"
#import "PointAdded.h"
#import "MazeSolver.h"
#import "Queue.h"

int count = 0;

@implementation GameScene {
    NSTimeInterval _lastUpdateTime;
    SKShapeNode *_spinnyNode;
    SKLabelNode *_label;
    SKShapeNode *_trialRect;
}



- (void)sceneDidLoad {
    // Setup your scene here
    self.myMazeSolver = [[MazeSolver alloc] init];
    
    self.myMazeSolver.delegate = self;
    
    

    
    //[myMazeSolver breadthSearch: startingNode];

    
    



//
//
//    // Initialize update time
//    _lastUpdateTime = 0;
//
//    // Get label node from scene and store it for use later
//    _label = (SKLabelNode *)[self childNodeWithName:@"//helloLabel"];
//
//    _label.alpha = 0.0;
//    [_label runAction:[SKAction fadeInWithDuration:2.0]];
//
//    CGFloat w = (self.size.width + self.size.height) * 0.05;
//
//    _spinnyNode = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(w, w) cornerRadius:w * 0.3];
//    _spinnyNode.lineWidth = 2.5;
//
//    [_spinnyNode runAction:[SKAction repeatActionForever:[SKAction rotateByAngle:M_PI duration:1]]];
//    [_spinnyNode runAction:[SKAction sequence:@[
//                                                [SKAction waitForDuration:0.5],
//                                                [SKAction fadeOutWithDuration:0.5],
//                                                [SKAction removeFromParent],
//                                                ]]];
}

-(void) updateView:(NSMutableArray*) mazeGiven{

    SKShapeNode *n;
    int x;
    int y = (self.size.height/2) - (self.size.width/22);
    int first = 0;
    for(int r =0; r < [mazeGiven count]; r++){
        NSLog(@"maze count is %d", [mazeGiven count] );
    
            x = -self.size.width/2 - self.size.width/16;
        
        for(int c=0; c < [[mazeGiven objectAtIndex:r] count]; c++){
            n = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(self.size.width/8, self.size.height/8) cornerRadius:30 * 0.3];
            x = x + self.size.width/8;
            if([mazeGiven[r][c] isEqualToString:@"#"]){
                n.fillColor = [NSColor greenColor];
                n.position = CGPointMake(x,y);
            }else if([mazeGiven[r][c] isEqualToString:@"."]){
                n.fillColor = [NSColor blackColor];
                n.position = CGPointMake(x,y);
            }
            [self addChild: n];
        }
        y = y - self.size.height/8;
        first++;
    }
}

//-(void)drawMoves:(NewNode *)currentNode{
//
//    if (currentNode.next){
//
//    }else{
//        SKShapeNode *b;
//        b.fillColor = [NSColor blueColor];
//        b.position = CGPointMake(currentNode.curr.x,currentNode.curr.y);
//        [self addChild:b];
//        [NSTimer ]
//    }
//}


- (void)touchDownAtPoint:(CGPoint)pos {
    SKShapeNode *n = [_spinnyNode copy];
    n.position = pos;
    n.strokeColor = [SKColor greenColor];
    [self addChild:n];
}

- (void)touchMovedToPoint:(CGPoint)pos {
    SKShapeNode *n = [_spinnyNode copy];
    n.position = pos;
    n.strokeColor = [SKColor blueColor];
    [self addChild:n];
}

- (void)touchUpAtPoint:(CGPoint)pos {
    SKShapeNode *n = [_spinnyNode copy];
    n.position = pos;
    n.strokeColor = [SKColor redColor];
    [self addChild:n];
}

- (void)keyDown:(NSEvent *)theEvent {
    switch (theEvent.keyCode) {
        case 0x31 /* SPACE */:
            // Run 'Pulse' action from 'Actions.sks'
            [_label runAction:[SKAction actionNamed:@"Pulse"] withKey:@"fadeInOut"];
            break;
            
        default:
            NSLog(@"keyDown:'%@' keyCode: 0x%02X", theEvent.characters, theEvent.keyCode);
            break;
    }
}

- (void)mouseDown:(NSEvent *)theEvent {
    [self touchDownAtPoint:[theEvent locationInNode:self]];
}
- (void)mouseDragged:(NSEvent *)theEvent {
    [self touchMovedToPoint:[theEvent locationInNode:self]];
}
- (void)mouseUp:(NSEvent *)theEvent {
    [self touchUpAtPoint:[theEvent locationInNode:self]];
}


-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
    
    // Initialize _lastUpdateTime if it has not already been
    if (_lastUpdateTime == 0) {
        _lastUpdateTime = currentTime;
    }
    
    // Calculate time since last update
    CGFloat dt = currentTime - _lastUpdateTime;
    
    // Update entities
    for (GKEntity *entity in self.entities) {
        [entity updateWithDeltaTime:dt];
    }
    
    _lastUpdateTime = currentTime;
}

@end
