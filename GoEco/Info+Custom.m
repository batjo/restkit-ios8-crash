//
//  Info+Custom.m
//  GoEco
//
//  Created by Bart Jochems on 21-08-14.
//  Copyright (c) 2014 Moboa. All rights reserved.
//

#import "Info+Custom.h"

@implementation Info (Custom)

- (NSString *)contentHTML {
    if (self.content) {
        return [self convertToHTML:self.content];
    }
    return nil;
}

- (NSString *)convertToHTML:(NSString *)text {
    NSMutableString *html = [[NSMutableString alloc] init];
    NSLog(@"appendhere3");
    [html appendString:@"<html><head><link rel=\"stylesheet\" type=\"text/css\" href=\"action.css\"></head><body>"];
    [html appendString:text];
    [html appendString:@"</body></html>"];
    return html;
}


@end
