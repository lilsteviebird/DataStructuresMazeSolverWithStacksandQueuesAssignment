//
//  ViewController.h
//  RealMazeSolver
//
//  Created by sli19 on 11/24/18.
//  Copyright © 2018 sli19. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <SpriteKit/SpriteKit.h>
#import <GameplayKit/GameplayKit.h>
#include "NewNode.h"

@interface ViewController : NSViewController

@property (strong) NewNode *currentNode;
@property (nonatomic) NSTimer *timer;
@property (assign) IBOutlet SKView *skView;
- (IBAction)startSolving:(id)sender;

@end

