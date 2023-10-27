; ModuleID = 'main.bc'
source_filename = "main.cu"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }
%struct.pixel = type { i32, i32, i32 }

$_ZN4dim3C2Ejjj = comdat any

$_ZN5pixelneERKS_ = comdat any

$_ZN5pixeleqERKS_ = comdat any

@.str = private unnamed_addr constant [24 x i8] c"Host data initialized:\0A\00", align 1
@.str.1 = private unnamed_addr constant [13 x i8] c"%d %d %d %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [34 x i8] c"Data after device internal copy:\0A\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"Error on pixel %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"All matched!\0A\00", align 1

; Function Attrs: noinline norecurse sspstrong uwtable
define dso_local void @_Z35__device_stub__rgb_copy_interleavedP5pixelS0_(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %struct.dim3, align 8
  %6 = alloca %struct.dim3, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca { i64, i32 }, align 8
  %10 = alloca { i64, i32 }, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %11 = alloca ptr, i64 2, align 16
  %12 = getelementptr ptr, ptr %11, i32 0
  store ptr %3, ptr %12, align 8
  %13 = getelementptr ptr, ptr %11, i32 1
  store ptr %4, ptr %13, align 8
  %14 = call i32 @__cudaPopCallConfiguration(ptr %5, ptr %6, ptr %7, ptr %8)
  %15 = load i64, ptr %7, align 8
  %16 = load ptr, ptr %8, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %9, ptr align 8 %5, i64 12, i1 false)
  %17 = getelementptr inbounds { i64, i32 }, ptr %9, i32 0, i32 0
  %18 = load i64, ptr %17, align 8
  %19 = getelementptr inbounds { i64, i32 }, ptr %9, i32 0, i32 1
  %20 = load i32, ptr %19, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %10, ptr align 8 %6, i64 12, i1 false)
  %21 = getelementptr inbounds { i64, i32 }, ptr %10, i32 0, i32 0
  %22 = load i64, ptr %21, align 8
  %23 = getelementptr inbounds { i64, i32 }, ptr %10, i32 0, i32 1
  %24 = load i32, ptr %23, align 8
  %25 = call noundef i32 @cudaLaunchKernel(ptr noundef @_Z35__device_stub__rgb_copy_interleavedP5pixelS0_, i64 %18, i32 %20, i64 %22, i32 %24, ptr noundef %11, i64 noundef %15, ptr noundef %16)
  br label %26

26:                                               ; preds = %2
  ret void
}

declare i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr)

declare i32 @cudaLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr)

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noinline norecurse sspstrong uwtable
define dso_local void @_Z33__device_stub__rgb_copy_coalescedP5pixelS0_(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %struct.dim3, align 8
  %6 = alloca %struct.dim3, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca { i64, i32 }, align 8
  %10 = alloca { i64, i32 }, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %11 = alloca ptr, i64 2, align 16
  %12 = getelementptr ptr, ptr %11, i32 0
  store ptr %3, ptr %12, align 8
  %13 = getelementptr ptr, ptr %11, i32 1
  store ptr %4, ptr %13, align 8
  %14 = call i32 @__cudaPopCallConfiguration(ptr %5, ptr %6, ptr %7, ptr %8)
  %15 = load i64, ptr %7, align 8
  %16 = load ptr, ptr %8, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %9, ptr align 8 %5, i64 12, i1 false)
  %17 = getelementptr inbounds { i64, i32 }, ptr %9, i32 0, i32 0
  %18 = load i64, ptr %17, align 8
  %19 = getelementptr inbounds { i64, i32 }, ptr %9, i32 0, i32 1
  %20 = load i32, ptr %19, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %10, ptr align 8 %6, i64 12, i1 false)
  %21 = getelementptr inbounds { i64, i32 }, ptr %10, i32 0, i32 0
  %22 = load i64, ptr %21, align 8
  %23 = getelementptr inbounds { i64, i32 }, ptr %10, i32 0, i32 1
  %24 = load i32, ptr %23, align 8
  %25 = call noundef i32 @cudaLaunchKernel(ptr noundef @_Z33__device_stub__rgb_copy_coalescedP5pixelS0_, i64 %18, i32 %20, i64 %22, i32 %24, ptr noundef %11, i64 noundef %15, ptr noundef %16)
  br label %26

26:                                               ; preds = %2
  ret void
}

; Function Attrs: mustprogress noinline norecurse sspstrong uwtable
define dso_local noundef i32 @main() #2 {
  %1 = alloca i32, align 4
  %2 = alloca [32 x %struct.pixel], align 16
  %3 = alloca [32 x %struct.pixel], align 16
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.pixel, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.dim3, align 4
  %10 = alloca %struct.dim3, align 4
  %11 = alloca %struct.dim3, align 4
  %12 = alloca %struct.dim3, align 4
  %13 = alloca { i64, i32 }, align 4
  %14 = alloca { i64, i32 }, align 4
  %15 = alloca i8, align 1
  %16 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @srand(i32 noundef 1) #8
  store i32 0, ptr %6, align 4
  br label %17

17:                                               ; preds = %33, %0
  %18 = load i32, ptr %6, align 4
  %19 = icmp slt i32 %18, 32
  br i1 %19, label %20, label %36

20:                                               ; preds = %17
  %21 = getelementptr inbounds %struct.pixel, ptr %7, i32 0, i32 0
  %22 = call i32 @rand() #8
  %23 = srem i32 %22, 256
  store i32 %23, ptr %21, align 4
  %24 = getelementptr inbounds %struct.pixel, ptr %7, i32 0, i32 1
  %25 = call i32 @rand() #8
  %26 = srem i32 %25, 256
  store i32 %26, ptr %24, align 4
  %27 = getelementptr inbounds %struct.pixel, ptr %7, i32 0, i32 2
  %28 = call i32 @rand() #8
  %29 = srem i32 %28, 256
  store i32 %29, ptr %27, align 4
  %30 = load i32, ptr %6, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [32 x %struct.pixel], ptr %2, i64 0, i64 %31
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %32, ptr align 4 %7, i64 12, i1 false)
  br label %33

33:                                               ; preds = %20
  %34 = load i32, ptr %6, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %6, align 4
  br label %17, !llvm.loop !7

36:                                               ; preds = %17
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 0, ptr %8, align 4
  br label %38

38:                                               ; preds = %59, %36
  %39 = load i32, ptr %8, align 4
  %40 = icmp slt i32 %39, 32
  br i1 %40, label %41, label %62

41:                                               ; preds = %38
  %42 = load i32, ptr %8, align 4
  %43 = load i32, ptr %8, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [32 x %struct.pixel], ptr %2, i64 0, i64 %44
  %46 = getelementptr inbounds %struct.pixel, ptr %45, i32 0, i32 0
  %47 = load i32, ptr %46, align 4
  %48 = load i32, ptr %8, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [32 x %struct.pixel], ptr %2, i64 0, i64 %49
  %51 = getelementptr inbounds %struct.pixel, ptr %50, i32 0, i32 1
  %52 = load i32, ptr %51, align 4
  %53 = load i32, ptr %8, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [32 x %struct.pixel], ptr %2, i64 0, i64 %54
  %56 = getelementptr inbounds %struct.pixel, ptr %55, i32 0, i32 2
  %57 = load i32, ptr %56, align 4
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %42, i32 noundef %47, i32 noundef %52, i32 noundef %57)
  br label %59

59:                                               ; preds = %41
  %60 = load i32, ptr %8, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr %8, align 4
  br label %38, !llvm.loop !9

62:                                               ; preds = %38
  %63 = call noundef i32 @_ZL10cudaMallocI5pixelE9cudaErrorPPT_m(ptr noundef %4, i64 noundef 384)
  %64 = call noundef i32 @_ZL10cudaMallocI5pixelE9cudaErrorPPT_m(ptr noundef %5, i64 noundef 384)
  %65 = load ptr, ptr %4, align 8
  %66 = getelementptr inbounds [32 x %struct.pixel], ptr %2, i64 0, i64 0
  %67 = call i32 @cudaMemcpy(ptr noundef %65, ptr noundef %66, i64 noundef 384, i32 noundef 1)
  call void @_ZN4dim3C2Ejjj(ptr noundef nonnull align 4 dereferenceable(12) %9, i32 noundef 1, i32 noundef 1, i32 noundef 1)
  call void @_ZN4dim3C2Ejjj(ptr noundef nonnull align 4 dereferenceable(12) %10, i32 noundef 32, i32 noundef 1, i32 noundef 1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %11, ptr align 4 %9, i64 12, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %12, ptr align 4 %10, i64 12, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %13, ptr align 4 %11, i64 12, i1 false)
  %68 = getelementptr inbounds { i64, i32 }, ptr %13, i32 0, i32 0
  %69 = load i64, ptr %68, align 4
  %70 = getelementptr inbounds { i64, i32 }, ptr %13, i32 0, i32 1
  %71 = load i32, ptr %70, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %14, ptr align 4 %12, i64 12, i1 false)
  %72 = getelementptr inbounds { i64, i32 }, ptr %14, i32 0, i32 0
  %73 = load i64, ptr %72, align 4
  %74 = getelementptr inbounds { i64, i32 }, ptr %14, i32 0, i32 1
  %75 = load i32, ptr %74, align 4
  %76 = call i32 @__cudaPushCallConfiguration(i64 %69, i32 %71, i64 %73, i32 %75, i64 noundef 384, ptr noundef null)
  %77 = icmp ne i32 %76, 0
  br i1 %77, label %81, label %78

78:                                               ; preds = %62
  %79 = load ptr, ptr %5, align 8
  %80 = load ptr, ptr %4, align 8
  call void @_Z35__device_stub__rgb_copy_interleavedP5pixelS0_(ptr noundef %79, ptr noundef %80)
  br label %81

81:                                               ; preds = %78, %62
  %82 = call i32 @cudaDeviceSynchronize()
  %83 = getelementptr inbounds [32 x %struct.pixel], ptr %3, i64 0, i64 0
  %84 = load ptr, ptr %5, align 8
  %85 = call i32 @cudaMemcpy(ptr noundef %83, ptr noundef %84, i64 noundef 384, i32 noundef 2)
  %86 = call i32 @cudaDeviceSynchronize()
  store i8 1, ptr %15, align 1
  %87 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  store i32 0, ptr %16, align 4
  br label %88

88:                                               ; preds = %120, %81
  %89 = load i32, ptr %16, align 4
  %90 = icmp slt i32 %89, 32
  br i1 %90, label %91, label %123

91:                                               ; preds = %88
  %92 = load i32, ptr %16, align 4
  %93 = load i32, ptr %16, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [32 x %struct.pixel], ptr %3, i64 0, i64 %94
  %96 = getelementptr inbounds %struct.pixel, ptr %95, i32 0, i32 0
  %97 = load i32, ptr %96, align 4
  %98 = load i32, ptr %16, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [32 x %struct.pixel], ptr %3, i64 0, i64 %99
  %101 = getelementptr inbounds %struct.pixel, ptr %100, i32 0, i32 1
  %102 = load i32, ptr %101, align 4
  %103 = load i32, ptr %16, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [32 x %struct.pixel], ptr %3, i64 0, i64 %104
  %106 = getelementptr inbounds %struct.pixel, ptr %105, i32 0, i32 2
  %107 = load i32, ptr %106, align 4
  %108 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %92, i32 noundef %97, i32 noundef %102, i32 noundef %107)
  %109 = load i32, ptr %16, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [32 x %struct.pixel], ptr %3, i64 0, i64 %110
  %112 = load i32, ptr %16, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [32 x %struct.pixel], ptr %2, i64 0, i64 %113
  %115 = call noundef zeroext i1 @_ZN5pixelneERKS_(ptr noundef nonnull align 4 dereferenceable(12) %111, ptr noundef nonnull align 4 dereferenceable(12) %114)
  br i1 %115, label %116, label %119

116:                                              ; preds = %91
  store i8 0, ptr %15, align 1
  %117 = load i32, ptr %16, align 4
  %118 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %117)
  br label %119

119:                                              ; preds = %116, %91
  br label %120

120:                                              ; preds = %119
  %121 = load i32, ptr %16, align 4
  %122 = add nsw i32 %121, 1
  store i32 %122, ptr %16, align 4
  br label %88, !llvm.loop !10

123:                                              ; preds = %88
  %124 = load i8, ptr %15, align 1
  %125 = trunc i8 %124 to i1
  br i1 %125, label %126, label %128

126:                                              ; preds = %123
  %127 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %128

128:                                              ; preds = %126, %123
  %129 = load ptr, ptr %4, align 8
  %130 = call i32 @cudaFree(ptr noundef %129)
  %131 = load ptr, ptr %5, align 8
  %132 = call i32 @cudaFree(ptr noundef %131)
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #3

; Function Attrs: nounwind
declare i32 @rand() #3

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: mustprogress noinline sspstrong uwtable
define internal noundef i32 @_ZL10cudaMallocI5pixelE9cudaErrorPPT_m(ptr noundef %0, i64 noundef %1) #5 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load i64, ptr %4, align 8
  %7 = call i32 @cudaMalloc(ptr noundef %5, i64 noundef %6)
  ret i32 %7
}

declare i32 @cudaMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) #4

; Function Attrs: noinline nounwind sspstrong uwtable
define linkonce_odr dso_local void @_ZN4dim3C2Ejjj(ptr noundef nonnull align 4 dereferenceable(12) %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) unnamed_addr #6 comdat align 2 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.dim3, ptr %9, i32 0, i32 0
  %11 = load i32, ptr %6, align 4
  store i32 %11, ptr %10, align 4
  %12 = getelementptr inbounds %struct.dim3, ptr %9, i32 0, i32 1
  %13 = load i32, ptr %7, align 4
  store i32 %13, ptr %12, align 4
  %14 = getelementptr inbounds %struct.dim3, ptr %9, i32 0, i32 2
  %15 = load i32, ptr %8, align 4
  store i32 %15, ptr %14, align 4
  ret void
}

declare i32 @__cudaPushCallConfiguration(i64, i32, i64, i32, i64 noundef, ptr noundef) #4

declare i32 @cudaDeviceSynchronize() #4

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr dso_local noundef zeroext i1 @_ZN5pixelneERKS_(ptr noundef nonnull align 4 dereferenceable(12) %0, ptr noundef nonnull align 4 dereferenceable(12) %1) #5 comdat align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call noundef zeroext i1 @_ZN5pixeleqERKS_(ptr noundef nonnull align 4 dereferenceable(12) %5, ptr noundef nonnull align 4 dereferenceable(12) %6)
  %8 = xor i1 %7, true
  ret i1 %8
}

declare i32 @cudaFree(ptr noundef) #4

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr dso_local noundef zeroext i1 @_ZN5pixeleqERKS_(ptr noundef nonnull align 4 dereferenceable(12) %0, ptr noundef nonnull align 4 dereferenceable(12) %1) #7 comdat align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.pixel, ptr %5, i32 0, i32 0
  %7 = load i32, ptr %6, align 4
  %8 = load ptr, ptr %4, align 8
  %9 = getelementptr inbounds %struct.pixel, ptr %8, i32 0, i32 0
  %10 = load i32, ptr %9, align 4
  %11 = icmp eq i32 %7, %10
  br i1 %11, label %12, label %26

12:                                               ; preds = %2
  %13 = getelementptr inbounds %struct.pixel, ptr %5, i32 0, i32 1
  %14 = load i32, ptr %13, align 4
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.pixel, ptr %15, i32 0, i32 1
  %17 = load i32, ptr %16, align 4
  %18 = icmp eq i32 %14, %17
  br i1 %18, label %19, label %26

19:                                               ; preds = %12
  %20 = getelementptr inbounds %struct.pixel, ptr %5, i32 0, i32 2
  %21 = load i32, ptr %20, align 4
  %22 = load ptr, ptr %4, align 8
  %23 = getelementptr inbounds %struct.pixel, ptr %22, i32 0, i32 2
  %24 = load i32, ptr %23, align 4
  %25 = icmp eq i32 %21, %24
  br label %26

26:                                               ; preds = %19, %12, %2
  %27 = phi i1 [ false, %12 ], [ false, %2 ], [ %25, %19 ]
  ret i1 %27
}

declare i32 @cudaMalloc(ptr noundef, i64 noundef) #4

attributes #0 = { noinline norecurse sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress noinline norecurse sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress noinline sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 8]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = !{!"clang version 16.0.6"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
!10 = distinct !{!10, !8}
