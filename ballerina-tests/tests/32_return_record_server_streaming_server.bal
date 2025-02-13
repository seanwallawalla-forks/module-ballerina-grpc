// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/grpc;

listener grpc:Listener ep32 = new (9122);

@grpc:ServiceDescriptor {
    descriptor: ROOT_DESCRIPTOR_32_RETURN_RECORD_SERVER_STREAMING,
    descMap: getDescriptorMap32ReturnRecordServerStreaming()
}
service "HelloWorld32" on ep32 {

    remote isolated function sayHello(SampleMsg32 value) returns stream<SampleMsg32, error?> {
        SampleMsg32[] respArr = [
            {name: "WSO2", id: 0},
            {name: "Microsoft", id: 1},
            {name: "Facebook", id: 2},
            {name: "Google", id: 3}
        ];
        return respArr.toStream();
    }
}
