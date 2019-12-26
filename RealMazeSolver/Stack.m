//
//  Stack.m
//  RealMazeSolver
//
//  Created by sli19 on 11/24/18.
//  Copyright © 2018 sli19. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewNode.h"
#import "Stack.h"


@implementation Stack: NSObject

-(void) push: (NewNode*) c {
    NSLog(@"pushing....");
    if(self.top==nil){
        self.top = [[NewNode alloc] initWithNode:c];
        return;
    }
    NewNode *temp = self.top;
    NewNode *n = [[NewNode alloc] initWithNode: c];
    self.top = n;
    n.next = temp;
}

-(id) pop {
    NSLog(@"popping...");
    NewNode *temp;
    NewNode *save = self.top;
    temp = self.top.next;
    self.top = temp;
    return save.curr;
}

-(id) peek {
    NSLog(@"peeking...");
    //NSLog(@"to add stuff %i, %i", self.top.curr.x, self.top.curr.y);
    return self.top;
}

-(bool) isEmpty {
    if (self.top == nil) {
        return true;
    } else {
        return false;
    }
}

-(void) displayStack {
    NSLog(@"in displaying the stack...");
    NewNode *temp = self.top;
    while (temp != nil) {
       // NSLog(@"point is (%i, %i)", temp.curr.x ,temp.curr.y); //error
        temp = temp.next;
    }
}


@end
