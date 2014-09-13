//
//  Action.h
//  GoEco
//
//  Created by Bart Jochems on 11-09-14.
//  Copyright (c) 2014 Moboa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AbstractItem.h"

@class Action, HouseType, Product, Slide, Tip;

@interface Action : AbstractItem

@property (nonatomic, retain) NSNumber * biodiversity;
@property (nonatomic, retain) NSNumber * completed;
@property (nonatomic, retain) NSNumber * costs;
@property (nonatomic, retain) NSNumber * difficulty;
@property (nonatomic, retain) NSNumber * hasLocalChanges;
@property (nonatomic, retain) NSNumber * heat;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSNumber * imageHeight;
@property (nonatomic, retain) NSString * imageURL;
@property (nonatomic, retain) NSNumber * imageWidth;
@property (nonatomic, retain) NSString * link;
@property (nonatomic, retain) NSString * linkDescription;
@property (nonatomic, retain) NSString * linkImageURL;
@property (nonatomic, retain) NSString * linkTitle;
@property (nonatomic, retain) NSNumber * maintenance;
@property (nonatomic, retain) NSString * movieImageURL;
@property (nonatomic, retain) NSString * movieTabletImageUrl;
@property (nonatomic, retain) NSString * noText;
@property (nonatomic, retain) NSNumber * nutrition;
@property (nonatomic, retain) id productIDs;
@property (nonatomic, retain) id relatedActionIDs;
@property (nonatomic, retain) NSNumber * score;
@property (nonatomic, retain) NSString * subTitle;
@property (nonatomic, retain) NSString * summary;
@property (nonatomic, retain) NSString * tabletSideBarURL;
@property (nonatomic, retain) NSString * tabletThumbnailURL;
@property (nonatomic, retain) NSNumber * water;
@property (nonatomic, retain) NSNumber * xPosition;
@property (nonatomic, retain) NSString * yesText;
@property (nonatomic, retain) NSString * youtubeID;
@property (nonatomic, retain) NSNumber * yPosition;
@property (nonatomic, retain) NSSet *houseTypes;
@property (nonatomic, retain) NSSet *inverseRelatedActions;
@property (nonatomic, retain) NSOrderedSet *products;
@property (nonatomic, retain) NSSet *relatedActions;
@property (nonatomic, retain) NSOrderedSet *slides;
@property (nonatomic, retain) NSOrderedSet *tips;
@end

@interface Action (CoreDataGeneratedAccessors)

- (void)addHouseTypesObject:(HouseType *)value;
- (void)removeHouseTypesObject:(HouseType *)value;
- (void)addHouseTypes:(NSSet *)values;
- (void)removeHouseTypes:(NSSet *)values;

- (void)addInverseRelatedActionsObject:(Action *)value;
- (void)removeInverseRelatedActionsObject:(Action *)value;
- (void)addInverseRelatedActions:(NSSet *)values;
- (void)removeInverseRelatedActions:(NSSet *)values;

- (void)insertObject:(Product *)value inProductsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromProductsAtIndex:(NSUInteger)idx;
- (void)insertProducts:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeProductsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInProductsAtIndex:(NSUInteger)idx withObject:(Product *)value;
- (void)replaceProductsAtIndexes:(NSIndexSet *)indexes withProducts:(NSArray *)values;
- (void)addProductsObject:(Product *)value;
- (void)removeProductsObject:(Product *)value;
- (void)addProducts:(NSOrderedSet *)values;
- (void)removeProducts:(NSOrderedSet *)values;
- (void)addRelatedActionsObject:(Action *)value;
- (void)removeRelatedActionsObject:(Action *)value;
- (void)addRelatedActions:(NSSet *)values;
- (void)removeRelatedActions:(NSSet *)values;

- (void)insertObject:(Slide *)value inSlidesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromSlidesAtIndex:(NSUInteger)idx;
- (void)insertSlides:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeSlidesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInSlidesAtIndex:(NSUInteger)idx withObject:(Slide *)value;
- (void)replaceSlidesAtIndexes:(NSIndexSet *)indexes withSlides:(NSArray *)values;
- (void)addSlidesObject:(Slide *)value;
- (void)removeSlidesObject:(Slide *)value;
- (void)addSlides:(NSOrderedSet *)values;
- (void)removeSlides:(NSOrderedSet *)values;
- (void)insertObject:(Tip *)value inTipsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromTipsAtIndex:(NSUInteger)idx;
- (void)insertTips:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeTipsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInTipsAtIndex:(NSUInteger)idx withObject:(Tip *)value;
- (void)replaceTipsAtIndexes:(NSIndexSet *)indexes withTips:(NSArray *)values;
- (void)addTipsObject:(Tip *)value;
- (void)removeTipsObject:(Tip *)value;
- (void)addTips:(NSOrderedSet *)values;
- (void)removeTips:(NSOrderedSet *)values;
@end
