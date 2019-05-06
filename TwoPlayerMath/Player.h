//
//  Player.h
//  TwoPlayerMath
//
//  Created by Frank Chen on 2019-05-06.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Player : NSObject

@property (nonatomic, strong) NSString* name;
@property (nonatomic, assign) NSInteger numberOfLives;
@property (nonatomic, assign) BOOL gameOver;
@property (nonatomic, assign) NSInteger score;

-(void)losingLife;

@end

NS_ASSUME_NONNULL_END
