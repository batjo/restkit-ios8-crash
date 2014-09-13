//
//  Ambition.h
//  GoEco
//
//  Created by Bart Jochems on 11-09-14.
//  Copyright (c) 2014 Moboa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AbstractItem.h"

@class Slide;

@interface Ambition : AbstractItem

@property (nonatomic, retain) NSNumber * imageHeight;
@property (nonatomic, retain) NSString * imageURL;
@property (nonatomic, retain) NSNumber * imageWidth;
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) NSSet *slides;
@end

@interface Ambition (CoreDataGeneratedAccessors)

- (void)addSlidesObject:(Slide *)value;
- (void)removeSlidesObject:(Slide *)value;
- (void)addSlides:(NSSet *)values;
- (void)removeSlides:(NSSet *)values;

@end
