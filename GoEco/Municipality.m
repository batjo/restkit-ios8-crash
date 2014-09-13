//
//  Municipality.m
//  GoEco
//
//  Created by Bart Jochems on 11-08-14.
//  Copyright (c) 2014 Moboa. All rights reserved.
//

#import "Municipality.h"

@implementation Municipality

- (id)initWithName:(NSString *)name code:(NSString *)code {
    self = [super init];
    if (self) {
        self.name = name;
        self.code = code;
    }
    return self;
}

@end
