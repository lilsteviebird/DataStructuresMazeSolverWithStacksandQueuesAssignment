//
//  NewNode.h
//  RealMazeSolver
//
//  Created by sli19 on 11/24/18.
//  Copyright © 2018 sli19. All rights reserved.
//

#ifndef NewNode_h
#define NewNode_h
#import "PointAdded.h"

@interface NewNode<ObjectType>: NSObject

@property NewNode *next;
@property PointAdded* curr;
@property NewNode *previous;
@property NewNode *parent;

-(id)initWithNode: (NewNode*) n;
-(void) setPoint: (PointAdded*) pointToAdd;
-(void) setNewX: (int) newX;
-(void) setNewY: (int) newY;
@end

#endif /* NewNode_h */
