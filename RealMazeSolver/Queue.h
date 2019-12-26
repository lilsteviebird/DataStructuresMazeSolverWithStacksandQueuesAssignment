//
//  Queue.h
//  RealMazeSolver
//
//  Created by sli19 on 12/4/18.
//  Copyright © 2018 sli19. All rights reserved.
//

#ifndef Queue_h
#define Queue_h
#import "NewNode.h"
@interface Queue<ObjectType> : NSObject

@property NewNode* last;
@property NewNode* temp;
@property NewNode* first;

-(void) enqueue: (id) itemGiven;
-(id) dequeue;
-(BOOL) isEmpty;
-(void) displayQueue;
-(id) getLast;
-(id) getFirst;

@end
#endif /* Queue_h */
