//
//  HouseType.h
//  GoEco
//
//  Created by Bart Jochems on 11-09-14.
//  Copyright (c) 2014 Moboa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Action;

@interface HouseType : NSManagedObject

@property (nonatomic, retain) NSNumber * houseTypeID;
@property (nonatomic, retain) NSSet *actions;
@end

@interface HouseType (CoreDataGeneratedAccessors)

- (void)addActionsObject:(Action *)value;
- (void)removeActionsObject:(Action *)value;
- (void)addActions:(NSSet *)values;
- (void)removeActions:(NSSet *)values;

@end
