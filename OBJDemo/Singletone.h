//
//  Singletone.h
//  OBJDemo
//
//  Created by 1234 on 02/04/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Singletone : NSObject

+(instancetype)singleShared;


-(void)makeRequest;

@end

NS_ASSUME_NONNULL_END
