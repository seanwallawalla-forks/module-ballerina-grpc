import ballerina/grpc;

listener grpc:Listener ep = new (9090);

@grpc:ServiceDescriptor {descriptor: ROOT_DESCRIPTOR_HELLOWORLDMESSAGE, descMap: getDescriptorMapHelloWorldMessage()}
service "helloWorld" on ep {

    remote function hello(stream<HelloRequest, grpc:Error?> clientStream) returns HelloResponse|error {
    }
    remote function bye(stream<ByeRequest, grpc:Error?> clientStream) returns ByeResponse|error {
    }
}

