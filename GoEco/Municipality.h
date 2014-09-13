//
//  Municipality.h
//  GoEco
//
//  Created by Bart Jochems on 11-08-14.
//  Copyright (c) 2014 Moboa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Municipality : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *code;

- (id)initWithName:(NSString *)name code:(NSString *)code;

@end
