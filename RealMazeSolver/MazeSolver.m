//
//  MazeSolver.m
//  RealMazeSolver
//
//  Created by sli19 on 11/24/18.
//  Copyright © 2018 sli19. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MazeSolver.h"
#import "Stack.h"
#import "Queue.h"
#import "GameScene.h"
@implementation MazeSolver

NewNode *toAdd;

-(id)init{
    self=[super init];
    if(self){
        NSLog(@"setting up my maze");
        self.myMaze = [[Maze alloc] init];
        [self.myMaze createSmallMaze];
       // NSMutableArray *finalDrawing = [self.myMaze createSmallMaze];
    }
    return self;
}

-(bool)checkDown: (NewNode*) point{
    //NSLog(@"the thing above %@", self.myMaze.maze[point.curr.x + 1][point.curr.y]);
    NSString *compareDown = self.myMaze.maze[point.curr.x + 1][point.curr.y];
    NSString *right = @".";
    NSString *finished = @"G";
    return([compareDown isEqualToString:right] || [compareDown isEqualToString: finished]);
    
}

-(bool)checkUp: (NewNode*) point{
    //NSLog(@"the thing below %@", self.myMaze.maze[point.curr.x - 1][point.curr.y]);
    NSString *compareUp = self.myMaze.maze[point.curr.x - 1][point.curr.y];
    NSString *right = @".";
    NSString *finished = @"G";
    return([compareUp isEqualToString:right] || [compareUp isEqualToString: finished]);
    
}

-(bool)checkRight: (NewNode*) point{
    //NSLog(@"the thing to the right %@", self.myMaze.maze[point.curr.x][point.curr.y + 1]);
    NSString *compareRight = self.myMaze.maze[point.curr.x][point.curr.y + 1];
    NSString *right = @".";
    NSString *finished = @"G";
    return([compareRight isEqualToString:right] || [compareRight isEqualToString: finished]);
    
}

-(bool)checkLeft: (NewNode*) point{
    //NSLog(@"the thing to the left %@", self.myMaze.maze[point.curr.x][point.curr.y - 1]);
    NSString *compareLeft = self.myMaze.maze[point.curr.x][point.curr.y - 1];
    NSString *right = @".";
    NSString *finished = @"G";
    return([compareLeft isEqualToString:right] || [compareLeft isEqualToString: finished]);
    
}

-(void)displayMaze{
    for(int r =0; r < self.myMaze.maze.count; r++){
        for(int c=0; c < [[self.myMaze.maze objectAtIndex:r] count]; c++){
            printf("%s",[[[self.myMaze.maze objectAtIndex:r] objectAtIndex:c] UTF8String]);
            
        }
        printf("\n");
        
    }
}

-(NewNode*) finalMove: (NewNode*) given{
    if([self checkUp: given]){
        given.curr.x = given.curr.x++;
        return given;
    }
    else if([self checkDown:given]){
        given.curr.x = given.curr.x--;
        return given;
    }
    else if([self checkRight: given]){
        given.curr.y = given.curr.y++;
        return given;
    }
    else if([self checkLeft: given]){
        given.curr.y = given.curr.y--;
        return given;
    }
    return given;
}

-(void)depthSearch: (NewNode*) beginning{
    NewNode* toAdd = [[NewNode alloc] initWithNode:beginning];
    
    int x = 10;
    
    Stack* solvingStack = [[Stack alloc] init];
    [solvingStack push:toAdd];
    self.myMaze.maze[toAdd.curr.x][toAdd.curr.y] = @"X";
    NSLog(@"%@", self.myMaze.maze);
    
    while(![self.myMaze.maze[toAdd.curr.x][toAdd.curr.y] isEqualToString: @"G"]){
        self.myMaze.maze[toAdd.curr.x][toAdd.curr.y] = @"X";
        if([self checkDown: toAdd]){
            NSLog(@"going down");
            //            toAdd.curr.x = toAdd.curr.x + 1;
            int xplus = toAdd.curr.x;
            x = x + 20;
            xplus = xplus + 1;
            [toAdd setNewX: xplus];
            NSLog(@"we are pushing (%i, %i)", toAdd.curr.x, toAdd.curr.y);
            [self displayMaze];
            [solvingStack push: toAdd];
        }
        else if([self checkUp: toAdd] ){
            NSLog(@"going up");
            //            toAdd.curr.x = toAdd.curr.x - 1;
            int xminus = toAdd.curr.x;
            xminus = xminus - 1;
            [toAdd setNewX: xminus];
            [self displayMaze];
            [solvingStack push: toAdd];
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [self.delegate updateView: self.myMaze.maze];
//            });
//
            //NSLog(@"%@", self.myMaze.maze);
        }
        else if([self checkRight: toAdd]){
            NSLog(@"going right");
            //            toAdd.curr.y = toAdd.curr.y + 1;
            int yplus = toAdd.curr.y;
            yplus = yplus + 1;
            [toAdd setNewY: yplus];
            [self displayMaze];
            [solvingStack push: toAdd];
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [self.delegate updateView: self.myMaze.maze];
//            });
//
            //NSLog(@"%@", self.myMaze.maze);
        }
        else if([self checkLeft: toAdd]){
            NSLog(@"going left");
            //            toAdd.curr.y = toAdd.curr.y - 1;
            int yminus = toAdd.curr.y;
            yminus = yminus - 1;
            [toAdd setNewY: yminus];
            NSLog(@"we are pushing (%i, %i)", toAdd.curr.x, toAdd.curr.y);
            [self displayMaze];
            [solvingStack push: toAdd];
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [self.delegate updateView: self.myMaze.maze];
//            });
            
            //NSLog(@"%@", self.myMaze.maze);
        }
        else{
            [solvingStack pop];
            //[solvingStack displayStack];
            toAdd = [solvingStack peek];
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [self.delegate updateView: self.myMaze.maze];
//            });
            
            NSLog(@"The current top of the stack is (%i, %i)", toAdd.curr.x, toAdd.curr.y);
        }

        // [NSThread sleepForTimeInterval: 1];
    }
    NSLog(@"It's cleared!");
    [self finalMove: toAdd];
    self.myMaze.maze[toAdd.curr.x][toAdd.curr.y] = @"X";
    self.solvingStack = solvingStack;
    [self.delegate updateView: self.myMaze.maze];
    
    [self displayMaze];
}




-(void) breadthSearch: (NewNode*) beginning{
    
    NSMutableArray <NewNode *> *allMoves = [NSMutableArray array];
    
    Queue* solveQueue = [[Queue alloc] init];
    self.myMaze.maze[beginning.curr.x][beginning.curr.y] = @"X";
    [solveQueue enqueue: beginning];
    
    
    
    while(![solveQueue isEmpty]){
        
        [allMoves addObject:[solveQueue getFirst]];
        toAdd = [[NewNode alloc] initWithNode:[solveQueue dequeue]];
        
        //peek off queue and then set that to the new Node/point to look at
        
        if([self checkDown: toAdd]){
            NSLog(@"going down");
            int x = toAdd.curr.x + 1;
            PointAdded* nextMove = [[PointAdded alloc] initAtPointX: x andY: toAdd.curr.y];
            //NewNode* firstWay = [[NewNode alloc] initWithPoint: nextMove];
            NewNode *firstWay = [[NewNode alloc] init];;
            firstWay.curr = nextMove;
            firstWay.parent = toAdd;
            self.myMaze.maze[firstWay.curr.x][firstWay.curr.y] = @"X";
            firstWay.previous = toAdd;
            [solveQueue enqueue: firstWay];
        }
        if([self checkUp: toAdd] ){
            NSLog(@"going up");
            int x = toAdd.curr.x - 1;
            PointAdded* nextMove = [[PointAdded alloc] initAtPointX: x andY: toAdd.curr.y];
           // NewNode* secondWay = [[NewNode alloc] initWithPoint: nextMove];
            NewNode *secondWay = [[NewNode alloc] init];;
            secondWay.curr = nextMove;
            secondWay.parent=toAdd;
            self.myMaze.maze[secondWay.curr.x][secondWay.curr.y] = @"X";
            secondWay.previous = toAdd;
            [solveQueue enqueue: secondWay];
        }
        if([self checkRight: toAdd]){
            NSLog(@"going right");
            int y = toAdd.curr.y + 1;
            PointAdded* nextMove = [[PointAdded alloc] initAtPointX: toAdd.curr.x andY: y];
          //  NewNode* thirdWay = [[NewNode alloc] initWithPoint: nextMove];
            NewNode *thirdWay = [[NewNode alloc] init];
            [thirdWay setNewX:nextMove.x];
            [thirdWay setNewY:nextMove.y];
            thirdWay.parent=toAdd;
            self.myMaze.maze[thirdWay.curr.x][thirdWay.curr.y] = @"X";
            thirdWay.previous = toAdd;
            [solveQueue enqueue: thirdWay];
        }
        if([self checkLeft: toAdd]){
            NSLog(@"going left");
            int y = toAdd.curr.y - 1;
            PointAdded* nextMove = [[PointAdded alloc] initAtPointX:toAdd.curr.x andY: y];
  //          NewNode *fourthWay = [[NewNode alloc] initWithPoint: nextMove];
            NewNode *fourthWay = [[NewNode alloc] init];;
            fourthWay.curr = nextMove;
            fourthWay.parent=toAdd;
            self.myMaze.maze[fourthWay.curr.x][fourthWay.curr.y] = @"X";
            fourthWay.previous = toAdd;
            [solveQueue enqueue: fourthWay];
        }
        [self displayMaze];
    }
    
    while(toAdd.parent != nil){
        self.myMaze.maze[toAdd.curr.x][toAdd.curr.y] = @"O";
        toAdd = toAdd.parent;
        [self displayMaze];
    }
    self.myMaze.maze[beginning.curr.x][beginning.curr.y] = @"O";
    [self displayMaze];
  
    
    


    
}


@end
