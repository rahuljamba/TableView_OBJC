//
//  Singletone.m
//  OBJDemo
//
//  Created by 1234 on 02/04/25.
//

#import "Singletone.h"

@implementation Singletone

- (void)makeRequest {
    NSLog(@"call make request....");
}

+ (instancetype)singleShared {
    
    static  Singletone *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

@end
