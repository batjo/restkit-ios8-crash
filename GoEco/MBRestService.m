//
//  MBRestService.m
//  GoEco
//
//  Created by Bart Jochems on 30-06-14.
//  Copyright (c) 2014 Moboa. All rights reserved.
//

#import "MBRestService.h"
#import <RestKit/RestKit.h>
#import "MBObjectManager.h"

@implementation MBRestService

+ (MBRestService *)sharedService {
    static MBRestService *_sharedService = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedService = [[MBRestService alloc] init];
    });
    return _sharedService;
}

- (id)init
{
    self = [super init];
    if (self) {
        // Setup REST object manager
        [self initializeObjectManager];
    }
    return self;
}

- (void)initializeObjectManager {
    MBObjectManager *objectManager = [MBObjectManager sharedManager];
    
    // Setup trace levels
    // Log debugging info about Core Data
    
    //RKLogConfigureByName("RestKit/CoreData", RKLogLevelTrace);
    
    //Loging about the Entity Mapping
    //RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelTrace)
    
    // We want to work with JSON-Data
    [objectManager.HTTPClient setDefaultHeader:@"Accept" value:RKMIMETypeJSON];
    
    // Enable Activity Indicator Spinner
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    // Initialize managed object store
    NSManagedObjectModel *managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    RKManagedObjectStore *managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:managedObjectModel];
    objectManager.managedObjectStore = managedObjectStore;
    
    [managedObjectStore createPersistentStoreCoordinator];
    NSString *storePath = [RKApplicationDataDirectory() stringByAppendingPathComponent:@"GoEcoModel.sqlite"];
    
    NSDictionary *options = @{  NSMigratePersistentStoresAutomaticallyOption: @(YES),
                                NSInferMappingModelAutomaticallyOption: @(YES) };
    NSError *error;
    [managedObjectStore addSQLitePersistentStoreAtPath:storePath fromSeedDatabaseAtPath:nil withConfiguration:nil options:options error:&error];
    
    if(error) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        error = nil;
        [fileManager removeItemAtPath:storePath error:&error];
        [managedObjectStore addSQLitePersistentStoreAtPath:storePath fromSeedDatabaseAtPath:nil withConfiguration:nil options:options error:&error];
    }
    
    // Create the managed object contexts
    [managedObjectStore createManagedObjectContexts];
    // Configure a managed object cache to ensure we do not create duplicate objects
    //managedObjectStore.managedObjectCache = [[RKInMemoryManagedObjectCache alloc] initWithManagedObjectContext:managedObjectStore.persistentStoreManagedObjectContext];
    managedObjectStore.managedObjectCache = [[RKFetchRequestManagedObjectCache alloc] init];
    
    objectManager.requestSerializationMIMEType = RKMIMETypeJSON;
    
    // add mappings here

    // Tip mapping
    RKEntityMapping *tipMapping = [RKEntityMapping mappingForEntityForName:@"Tip" inManagedObjectStore:managedObjectStore];
    tipMapping.identificationAttributes = @[ @"tipID" ];
    [tipMapping addAttributeMappingsFromDictionary:@{
                                                         @"ID": @"tipID",
                                                         @"text": @"text",
                                                         }];
    
    // Slide mapping
    RKEntityMapping *slideMapping = [RKEntityMapping mappingForEntityForName:@"Slide" inManagedObjectStore:managedObjectStore];
    slideMapping.identificationAttributes = @[ @"slideID" ];
    [slideMapping addAttributeMappingsFromDictionary:@{
                                                     @"ID": @"slideID",
                                                     @"description": @"body",
                                                     @"image": @"image",
                                                     }];
    
    // Product mapping
    RKEntityMapping *productMapping = [RKEntityMapping mappingForEntityForName:@"Product" inManagedObjectStore:managedObjectStore];
    productMapping.identificationAttributes = @[ @"itemID" ];
    [productMapping addAttributeMappingsFromDictionary:@{
                                                        @"ID": @"itemID",
                                                        @"title": @"title",
                                                        @"content": @"body",
                                                        @"modified": @"modified",
                                                        @"downloaded": @"downloaded",
                                                        @"image.thumbnail_src": @"thumbnailURL",
                                                        @"image.src": @"imageURL",
                                                        @"image.height": @"imageHeight",
                                                        @"image.width": @"imageWidth",
                                                        @"image.thumbnail_tablet_src": @"thumbnailTabletURL",
                                                        @"store_url": @"storeURL",
                                                        @"store_image_url": @"storeImageURL",
                                                        }];
    
    
    // HouseType mapping
    RKEntityMapping *houseTypeMapping = [RKEntityMapping mappingForEntityForName:@"HouseType" inManagedObjectStore:managedObjectStore];
    houseTypeMapping.identificationAttributes = @[ @"houseTypeID" ];
    [houseTypeMapping addAttributeMappingsFromDictionary:@{
                                                         @"ID": @"houseTypeID",
                                                         }];
    
    // Action mapping
    RKEntityMapping *actionMapping = [RKEntityMapping mappingForEntityForName:@"Action" inManagedObjectStore:managedObjectStore];
    actionMapping.identificationAttributes = @[ @"itemID" ];
    [actionMapping addAttributeMappingsFromDictionary:@{
                                                         @"ID": @"itemID",
                                                         @"title": @"title",
                                                         @"summary": @"summary",
                                                         @"content": @"content",
                                                         @"modified": @"modified",
                                                         @"menu_order": @"order",
                                                         @"downloaded": @"downloaded",
                                                         @"water": @"water",
                                                         @"heat": @"heat",
                                                         @"biodiversity": @"biodiversity",
                                                         @"nutrition": @"nutrition",
                                                         @"costs": @"costs",
                                                         @"difficulty": @"difficulty",
                                                         @"maintenance": @"maintenance",
                                                         @"score": @"score",
                                                         @"relatedActions": @"relatedActionIDs",
                                                         @"products": @"productIDs",
                                                         @"x_pos": @"xPosition",
                                                         @"y_pos": @"yPosition",
                                                         @"image.src": @"imageURL",
                                                         @"image.height": @"imageHeight",
                                                         @"image.width": @"imageWidth",
                                                         @"yes_text": @"yesText",
                                                         @"no_text": @"noText",
                                                         @"image.tablet_thumbnail_src": @"tabletThumbnailURL",
                                                         @"image.tablet_sidebar_src" : @"tabletSideBarURL",
                                                         @"sub_title": @"subTitle",
                                                         @"youtube_id": @"youtubeID",
                                                         @"movie_image_url": @"movieImageURL",
                                                         @"movie_tablet_image_url": @"movieTabletImageUrl",
                                                         @"link.title": @"linkTitle",
                                                         @"link.description": @"linkDescription",
                                                         @"link.url": @"link",
                                                         @"link.image": @"linkImageURL",
                                                         }];
    
    
    // Connect related items
    NSEntityDescription *actionEntity = [NSEntityDescription entityForName:@"Action" inManagedObjectContext:managedObjectStore.persistentStoreManagedObjectContext];
    NSRelationshipDescription *relatedActions = [actionEntity relationshipsByName][@"relatedActions"];
    RKConnectionDescription *actionConnection = [[RKConnectionDescription alloc] initWithRelationship:relatedActions attributes:@{ @"relatedActionIDs": @"itemID" }];
    [actionMapping addConnection:actionConnection];
    
    // Connect Products
    NSRelationshipDescription *products = [actionEntity relationshipsByName][@"products"];
    RKConnectionDescription *productsConnection = [[RKConnectionDescription alloc] initWithRelationship:products attributes:@{ @"productIDs": @"itemID" }];
    [actionMapping addConnection:productsConnection];
    
    // Connect Tips
    [actionMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"tips" toKeyPath:@"tips" withMapping:tipMapping]];
    
    // Connect HouseTypes
    [actionMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"houseTypes" toKeyPath:@"houseTypes" withMapping:houseTypeMapping]];
    
    // Connect Slides
    [actionMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"slides" toKeyPath:@"slides" withMapping:slideMapping]];

    
    // Reponse descriptors
    
    // Actions
    RKResponseDescriptor *actionsResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:actionMapping method:RKRequestMethodGET pathPattern:@"/restkit-crash.json" keyPath:@"actions" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [objectManager addResponseDescriptor:actionsResponseDescriptor];
    
    // Products
    RKResponseDescriptor *productsResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:productMapping method:RKRequestMethodGET pathPattern:@"/restkit-crash.json" keyPath:@"products" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [objectManager addResponseDescriptor:productsResponseDescriptor];
}

@end
