//
//  main.m
//  CoreDataHotel
//
//  Created by Vincent Smithers on 3/21/16.
//  Copyright © 2016 Vince Smithers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
//Reletional Database:

/*
 
 
Each column is a property and each row is an instance.
 Instead of having data in the same files. Split it up into different files.
 The relation between the objects is the power of relational databases
 
 Core Data is not a DATABASE.
 It's object graph and persistent framework. Allows you to manage object graph.
 
 MOM- The Blueprint
 Persistent Store-Where objects are stored on disk.
 Managed Object Context- manage a collection of managed objects. The central object in the core data stack. Not thread safe.
 Managed Object- An instance of an entity.
 
 YOU-MOC-PSC-PS
 
 Everything happens on the main queue unless you specify that you want this to be on the background queue.
 

*/