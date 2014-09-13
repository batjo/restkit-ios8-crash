//
//  AbstractItem.h
//  GoEco
//
//  Created by Bart Jochems on 11-09-14.
//  Copyright (c) 2014 Moboa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface AbstractItem : NSManagedObject

@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSDate * downloaded;
@property (nonatomic, retain) NSNumber * itemID;
@property (nonatomic, retain) NSDate * modified;
@property (nonatomic, retain) NSNumber * order;
@property (nonatomic, retain) NSString * title;

@end
