//
//  Slide.h
//  GoEco
//
//  Created by Bart Jochems on 11-09-14.
//  Copyright (c) 2014 Moboa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Action, Ambition;

@interface Slide : NSManagedObject

@property (nonatomic, retain) NSString * body;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSString * slideID;
@property (nonatomic, retain) Action *action;
@property (nonatomic, retain) Ambition *ambition;

@end
