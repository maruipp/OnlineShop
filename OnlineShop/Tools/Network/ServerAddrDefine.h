//
//  Network.h
//  ASIHTTPRequest
//
//  Created by 瑞鹏 马 on 12-2-24.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#ifndef ASIHTTPRequest_Network_h
#define ASIHTTPRequest_Network_h

#define SERVER_ADDRESS @"http://114.113.227.80/zkbriphoneservices/handler.ashx"

//所以那个图片的地址最后是：图片服务器地址 + ProductID +  "/s1.jpg"
//eg.http://114.113.227.80/cas2011/ProductImage/1294363/s1.jpg
#define SERVER_PREFIX @"http://114.113.227.80/cas2011/ProductImage/"
#define SERVER_SUFFIX @"/s1.jpg"
#define TimeOutSeconds 15

typedef enum _MessageType
{
    Message_Send,
    Message_Receive,
}MessageType;


#endif
