//
//  GameScene.h
//  RealMazeSolver
//
//  Created by sli19 on 11/24/18.
//  Copyright © 2018 sli19. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <GameplayKit/GameplayKit.h>

@interface GameScene : SKScene

@property (nonatomic) NSMutableArray<GKEntity *> *entities;
@property (nonatomic) NSMutableDictionary<NSString*, GKGraph *> *graphs;

@end
