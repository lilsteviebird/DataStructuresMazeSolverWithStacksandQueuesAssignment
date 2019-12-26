//
//  MazeSolver.h
//  RealMazeSolver
//
//  Created by sli19 on 11/24/18.
//  Copyright © 2018 sli19. All rights reserved.
//

#ifndef MazeSolver_h
#define MazeSolver_h
#import "NewNode.h"
#import "Stack.h"
#import "Maze.h"



@interface MazeSolver:NSObject;

@property id delegate;
@property Stack *solvingStack;
@property Maze *myMaze;
-(id)init;
-(bool)checkDown: (NewNode*) point;
-(bool)checkUp: (NewNode*) point;
-(bool)checkLeft: (NewNode*) point;
-(bool)checkRight: (NewNode*) point;
-(void)depthSearch: (NewNode*) beginning;
-(void)breadthSearch: (NewNode*) beginning;

@end

@protocol MazeSolverDelegate<NSObject>
-(void)updateView:(NSMutableArray*) mazeGiven;
-(void)addNewElement;

@end

#endif /* MazeSolver_h */
