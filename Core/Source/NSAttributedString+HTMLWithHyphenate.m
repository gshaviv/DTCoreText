//
//  NSAttributedString+HTMLWithHyphenate.m
//  DTCoreText
//
//  Created by Guy Shaviv on 27/1/12.
//  Copyright (c) 2012 Drobnik.com. All rights reserved.
//

#import "NSAttributedString+HTMLWithHyphenate.h"
#import "DTHTMLAttributedStringBuilder.h"
#import "NSString+Hyphenate.h"
#import "DTHTMLElement.h"
#import "DTCoreTextParagraphStyle.h"

@implementation NSAttributedString (HTMLWithHyphenate)

- (id)initWithHTMLToHyphenate:(NSString *)html options:(NSDictionary *)options
{
	// only with valid data
	if (![html length])
	{
		return nil;
	}
	NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];	
	DTHTMLAttributedStringBuilder	*stringBuilder = [[DTHTMLAttributedStringBuilder alloc] initWithHTML:data options:options documentAttributes:nil];
	
	stringBuilder.willFlushCallback = ^(DTHTMLElement *currentTag){
		if (currentTag.paragraphStyle.textAlignment == kCTJustifiedTextAlignment) {
			currentTag.text = [currentTag.text stringByHyphenatingWithLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
		}
	};
	
	[stringBuilder buildString];
	
	return [stringBuilder generatedAttributedString];
}

@end
