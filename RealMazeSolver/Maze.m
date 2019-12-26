//
//  Maze.m
//  RealMazeSolver
//
//  Created by sli19 on 11/24/18.
//  Copyright © 2018 sli19. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Maze.h"

@implementation Maze


-(id) init{
    self= [super init];
    if(self){
        NSLog(@" setting up the maze in the maze class...");
        self.maze = [[NSMutableArray alloc] init];
        self.row = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSMutableArray*)createSmallMaze{
    //creates 2-D Array
    NSString *myPath = [[NSBundle mainBundle]pathForResource:@"smallMaze" ofType:@"txt"];
    NSString *myFile = [[NSString alloc]initWithContentsOfFile:myPath encoding:NSUTF8StringEncoding error:nil];
    NSArray *mySplit = [myFile componentsSeparatedByString:@"\n"];
    
    for(int i = 0; i < mySplit.count-1; i++){
        NSMutableArray *arrRow = [[NSMutableArray alloc] init];
        self.row[i] = mySplit[i];
        [self.maze addObject: arrRow];
    }
    for(int r =0; r < self.row.count; r++){
        for(int c=0; c < [self.row[r] length]; c++){
            [[self.maze objectAtIndex:r] addObject:[[self.row objectAtIndex:r] substringWithRange:NSMakeRange(c,1)]];
            
        }
        
    }
    
    
    //displays lists to console
    for(int r =0; r < self.maze.count; r++){
        for(int c=0; c < [[self.maze objectAtIndex:r] count]; c++){
            printf("%s",[[[self.maze objectAtIndex:r] objectAtIndex:c] UTF8String]);
            
        }
        printf("\n");
        
    }

    return self.maze;
}



@end
