// Code generated by protoc-gen-go-grpc. DO NOT EDIT.

package pr12er

import (
	context "context"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
// Requires gRPC-Go v1.32.0 or later.
const _ = grpc.SupportPackageIsVersion7

// Pr12ErServiceClient is the client API for Pr12ErService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type Pr12ErServiceClient interface {
	// buf:lint:ignore RPC_REQUEST_STANDARD_NAME
	// buf:lint:ignore RPC_RESPONSE_STANDARD_NAME
	GetHello(ctx context.Context, in *HelloRequest, opts ...grpc.CallOption) (*HelloResponse, error)
	GetVideos(ctx context.Context, in *GetVideosRequest, opts ...grpc.CallOption) (*GetVideosResponse, error)
	GetDetail(ctx context.Context, in *GetDetailRequest, opts ...grpc.CallOption) (*GetDetailResponse, error)
	// Report is a RPC for a bug report or a PR Video missing report.
	Report(ctx context.Context, in *ReportRequest, opts ...grpc.CallOption) (*ReportResponse, error)
}

type pr12ErServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewPr12ErServiceClient(cc grpc.ClientConnInterface) Pr12ErServiceClient {
	return &pr12ErServiceClient{cc}
}

func (c *pr12ErServiceClient) GetHello(ctx context.Context, in *HelloRequest, opts ...grpc.CallOption) (*HelloResponse, error) {
	out := new(HelloResponse)
	err := c.cc.Invoke(ctx, "/pkg.pr12er.Pr12erService/GetHello", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *pr12ErServiceClient) GetVideos(ctx context.Context, in *GetVideosRequest, opts ...grpc.CallOption) (*GetVideosResponse, error) {
	out := new(GetVideosResponse)
	err := c.cc.Invoke(ctx, "/pkg.pr12er.Pr12erService/GetVideos", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *pr12ErServiceClient) GetDetail(ctx context.Context, in *GetDetailRequest, opts ...grpc.CallOption) (*GetDetailResponse, error) {
	out := new(GetDetailResponse)
	err := c.cc.Invoke(ctx, "/pkg.pr12er.Pr12erService/GetDetail", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *pr12ErServiceClient) Report(ctx context.Context, in *ReportRequest, opts ...grpc.CallOption) (*ReportResponse, error) {
	out := new(ReportResponse)
	err := c.cc.Invoke(ctx, "/pkg.pr12er.Pr12erService/Report", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// Pr12ErServiceServer is the server API for Pr12ErService service.
// All implementations must embed UnimplementedPr12ErServiceServer
// for forward compatibility
type Pr12ErServiceServer interface {
	// buf:lint:ignore RPC_REQUEST_STANDARD_NAME
	// buf:lint:ignore RPC_RESPONSE_STANDARD_NAME
	GetHello(context.Context, *HelloRequest) (*HelloResponse, error)
	GetVideos(context.Context, *GetVideosRequest) (*GetVideosResponse, error)
	GetDetail(context.Context, *GetDetailRequest) (*GetDetailResponse, error)
	// Report is a RPC for a bug report or a PR Video missing report.
	Report(context.Context, *ReportRequest) (*ReportResponse, error)
	mustEmbedUnimplementedPr12ErServiceServer()
}

// UnimplementedPr12ErServiceServer must be embedded to have forward compatible implementations.
type UnimplementedPr12ErServiceServer struct {
}

func (UnimplementedPr12ErServiceServer) GetHello(context.Context, *HelloRequest) (*HelloResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetHello not implemented")
}
func (UnimplementedPr12ErServiceServer) GetVideos(context.Context, *GetVideosRequest) (*GetVideosResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetVideos not implemented")
}
func (UnimplementedPr12ErServiceServer) GetDetail(context.Context, *GetDetailRequest) (*GetDetailResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetDetail not implemented")
}
func (UnimplementedPr12ErServiceServer) Report(context.Context, *ReportRequest) (*ReportResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Report not implemented")
}
func (UnimplementedPr12ErServiceServer) mustEmbedUnimplementedPr12ErServiceServer() {}

// UnsafePr12ErServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to Pr12ErServiceServer will
// result in compilation errors.
type UnsafePr12ErServiceServer interface {
	mustEmbedUnimplementedPr12ErServiceServer()
}

func RegisterPr12ErServiceServer(s grpc.ServiceRegistrar, srv Pr12ErServiceServer) {
	s.RegisterService(&Pr12ErService_ServiceDesc, srv)
}

func _Pr12ErService_GetHello_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(HelloRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(Pr12ErServiceServer).GetHello(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/pkg.pr12er.Pr12erService/GetHello",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(Pr12ErServiceServer).GetHello(ctx, req.(*HelloRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Pr12ErService_GetVideos_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(GetVideosRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(Pr12ErServiceServer).GetVideos(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/pkg.pr12er.Pr12erService/GetVideos",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(Pr12ErServiceServer).GetVideos(ctx, req.(*GetVideosRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Pr12ErService_GetDetail_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(GetDetailRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(Pr12ErServiceServer).GetDetail(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/pkg.pr12er.Pr12erService/GetDetail",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(Pr12ErServiceServer).GetDetail(ctx, req.(*GetDetailRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Pr12ErService_Report_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(ReportRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(Pr12ErServiceServer).Report(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/pkg.pr12er.Pr12erService/Report",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(Pr12ErServiceServer).Report(ctx, req.(*ReportRequest))
	}
	return interceptor(ctx, in, info, handler)
}

// Pr12ErService_ServiceDesc is the grpc.ServiceDesc for Pr12ErService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var Pr12ErService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "pkg.pr12er.Pr12erService",
	HandlerType: (*Pr12ErServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "GetHello",
			Handler:    _Pr12ErService_GetHello_Handler,
		},
		{
			MethodName: "GetVideos",
			Handler:    _Pr12ErService_GetVideos_Handler,
		},
		{
			MethodName: "GetDetail",
			Handler:    _Pr12ErService_GetDetail_Handler,
		},
		{
			MethodName: "Report",
			Handler:    _Pr12ErService_Report_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "pkg/pr12er/service.proto",
}
