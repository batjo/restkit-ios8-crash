//
//  Product.h
//  GoEco
//
//  Created by Bart Jochems on 11-09-14.
//  Copyright (c) 2014 Moboa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AbstractItem.h"

@class Action;

@interface Product : AbstractItem

@property (nonatomic, retain) NSString * body;
@property (nonatomic, retain) NSNumber * imageHeight;
@property (nonatomic, retain) NSString * imageURL;
@property (nonatomic, retain) NSNumber * imageWidth;
@property (nonatomic, retain) NSString * storeImageURL;
@property (nonatomic, retain) NSString * storeURL;
@property (nonatomic, retain) NSString * thumbnailTabletURL;
@property (nonatomic, retain) NSString * thumbnailURL;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSSet *actions;
@end

@interface Product (CoreDataGeneratedAccessors)

- (void)addActionsObject:(Action *)value;
- (void)removeActionsObject:(Action *)value;
- (void)addActions:(NSSet *)values;
- (void)removeActions:(NSSet *)values;

@end
