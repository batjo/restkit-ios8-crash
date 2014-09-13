//
//  Tip.h
//  GoEco
//
//  Created by Bart Jochems on 11-09-14.
//  Copyright (c) 2014 Moboa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Action;

@interface Tip : NSManagedObject

@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSString * tipID;
@property (nonatomic, retain) Action *action;

@end
