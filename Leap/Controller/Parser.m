//
//  Parser.m
//  DrinkXML
//
//  Created by Dan on 17/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Parser.h"

@implementation Parser

-(id) initParser {
    
    if (self == [super init]) {
        
        app = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        
    }
    return self;
}

-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    
    if ([elementName isEqualToString:@"List"]) {
        
        app.listArray = [[NSMutableArray alloc] init];
    }
    else if([elementName isEqualToString:@"Text"] ){
        
        localizeDataStore = [[LocalizeDataStore alloc] init];
        
        localizeDataStore.textID = [[attributeDict objectForKey:@"ID"] integerValue];
    
    }
    
}

-(void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    if (!currentElementValue) {
        currentElementValue = [[NSMutableString alloc] initWithString:string];
    }
    else
        [currentElementValue appendString:string];
}

-(void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    if ([elementName isEqualToString:@"List"]) {
        return;
    }
    
    
    if ([elementName isEqualToString:@"Text"]) {
        [app.listArray addObject:localizeDataStore];
        
        localizeDataStore = nil;
        
    }
    else 
        [localizeDataStore setValue:currentElementValue forKey:elementName];
    
    currentElementValue = nil;
    
}

@end
