//
//  PointAdded.h
//  RealMazeSolver
//
//  Created by sli19 on 11/24/18.
//  Copyright © 2018 sli19. All rights reserved.
//

#ifndef PointAdded_h
#define PointAdded_h

@interface PointAdded:NSObject;

@property int x;
@property int y;
@property PointAdded *parent;
@property int numOfMoves;

-(id) initWithPoint: (PointAdded *)p;
-(id) initAtPointX: (int) x andY: (int) y;
@end

#endif /* PointAdded_h */
