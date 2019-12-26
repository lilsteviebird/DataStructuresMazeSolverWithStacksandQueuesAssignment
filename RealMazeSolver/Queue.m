//
//  Queue.m
//  RealMazeSolver
//
//  Created by sli19 on 12/4/18.
//  Copyright © 2018 sli19. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Queue.h"

@implementation Queue: NSObject


// adds a new member to line
-(void) enqueue: (NewNode *) c{
    NewNode* itemAdded = [[NewNode alloc] initWithNode: c];
    if(self.first==nil){
        NSLog(@"Enqueuing... (%i, %i)", itemAdded.curr.x, itemAdded.curr.y);
        self.first = itemAdded;
        return;
    }else{
        self.temp = self.first;
        while(self.temp.next != NULL){
            self.temp = self.temp.next;
        }
        NSLog(@"Enqueuing... (%i, %i)", itemAdded.curr.x, itemAdded.curr.y);
        self.temp.next= itemAdded;
    }
    
}

//removes current first member in line
-(NewNode *) dequeue{
    NewNode* itemDequeued = self.first;
    self.temp = self.first.next;
    self.first = NULL;
    self.first = self.temp;
    NSLog(@"Dequeueing... (%i, %i)", itemDequeued.curr.x, itemDequeued.curr.y);
    return itemDequeued;
}

-(id) getFirst{
    if(self.first == NULL){
        return self.first.curr;
    }
    return self.first.curr;
}


// checks to see if line is empty
-(BOOL) isEmpty{
    if(self.first){
        return NO;
    }else{
        return YES;
    }
}

//gets last member in Queue

-(id) getLast {
    if(self.first == NULL){
        return self.first.curr;
    }
    self.temp = self.first;
    while(self.temp != NULL){
        self.temp = self.first.next;
    }
    return self.temp.curr;
}

//display queue
-(void) displayQueue{
    self.temp = self.first;
    while(self.temp!= NULL){
        NSLog(@"The queue has this point, %i, %i",self.temp.curr.x, self.temp.curr.y);
        self.temp = self.temp.next;
    }
}

@end
