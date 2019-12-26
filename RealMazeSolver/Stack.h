//
//  Stack.h
//  RealMazeSolver
//
//  Created by sli19 on 11/24/18.
//  Copyright © 2018 sli19. All rights reserved.
//

#ifndef Stack_h
#define Stack_h
#import "NewNode.h"

@interface Stack<ObjectType> : NSObject
@property NewNode* top;


-(void) push: (ObjectType) c;
-(id) pop;
-(ObjectType) peek;
-(bool) isEmpty;
-(void) displayStack;


@end

#endif /* Stack_h */
