//
//  PointAdded.m
//  RealMazeSolver
//
//  Created by sli19 on 11/24/18.
//  Copyright © 2018 sli19. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PointAdded.h"


@implementation PointAdded

-(id) initAtPointX: (int) x andY: (int) y  andMoves: (int) moves withParent: (PointAdded *) point{
    self = [super init];
    if(self) {
        self.x = x;
        self.y = y;
        self.numOfMoves = moves;
        self.parent = point;
    }
    return self;
    }


-(id) initAtPointX: (int) x andY: (int) y {
    self = [super init];
    if(self) {
        self.x = x;
        self.y = y;
    }
    return self;
}

-(id) initWithPoint: (PointAdded *)p{
    self = [super init];
    if(self){
        self.x=p.x;
        self.y=p.y;
        self.numOfMoves=0;
    }
    return self;
}

@end
