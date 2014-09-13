//
//  MBObjectManager.m
//  GoEco
//
//  Created by Bart Jochems on 30-06-14.
//  Copyright (c) 2014 Moboa. All rights reserved.
//

#import "MBObjectManager.h"

@implementation MBObjectManager

+ (MBObjectManager *)sharedManager {
    static MBObjectManager *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [MBObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://batjo.nl"]];
    });
    return _sharedClient;
}


@end
