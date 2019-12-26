//
//  maze.h
//  MazeSolver
//
//  Created by sli19 on 11/6/18.
//  Copyright © 2018 sli19. All rights reserved.
//

#ifndef maze_h
#define maze_h
@interface Maze:NSObject;

@property NSMutableArray *maze;
@property NSMutableArray *row;


-(NSMutableArray*)createSmallMaze;
-(id)init;

@end
#endif /* maze_h */

