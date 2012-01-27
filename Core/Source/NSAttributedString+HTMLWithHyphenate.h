//
//  NSAttributedString+HTMLWithHyphenate.h
//  DTCoreText
//
//  Created by Guy Shaviv on 27/1/12.
//  Copyright (c) 2012 Drobnik.com. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *DTParagraphSpacing;


@interface NSAttributedString (HTMLWithHyphenate)
- (id)initWithHTML:(NSString *)html options:(NSDictionary *)options hyphenate:(BOOL)hyphenate;
@end
