//
//  NewNode.m
//  RealMazeSolver
//
//  Created by sli19 on 11/24/18.
//  Copyright © 2018 sli19. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewNode.h"

@implementation NewNode


-(id) init{
    self = [super init];
    if(self){
        self.curr=[[PointAdded alloc] init];
        self.parent = nil;
        NSLog(@"making a new node");
    }
    return self;
}

-(id)initWithNode: (NewNode *)n {
    self = [super init];
    if(self){
        self.curr = [[PointAdded alloc] initWithPoint: n.curr];
        self.parent = n.parent;
    }
    return self;
}

-(void) setPoint: (PointAdded*) pointToAdd{
    self.curr = pointToAdd;
    NSLog(@"point being added (%i, %i)", self.curr.x, self.curr.y);
}

-(void) setNewX: (int) newX{
    self.curr.x = newX;
}

-(void) setNewY: (int) newY{
    self.curr.y = newY;
}



@end
