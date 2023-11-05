; ModuleID = 'rgb.bc'
source_filename = "rgb.cu"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.dim3.1 = type { i32, i32, i32 }

; Function Attrs: noinline norecurse sspstrong uwtable
define dso_local void @_Z41__device_stub__rgb_copy_array_interleavedPiS_(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %struct.dim3.1, align 8
  %6 = alloca %struct.dim3.1, align 8
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
  %25 = call noundef i32 @cudaLaunchKernel(ptr noundef @_Z41__device_stub__rgb_copy_array_interleavedPiS_, i64 %18, i32 %20, i64 %22, i32 %24, ptr noundef %11, i64 noundef %15, ptr noundef %16)
  br label %26

26:                                               ; preds = %2
  ret void
}

declare i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr)

declare i32 @cudaLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr)

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noinline norecurse sspstrong uwtable
define dso_local void @_Z39__device_stub__rgb_copy_array_coalescedPiS_(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %struct.dim3.1, align 8
  %6 = alloca %struct.dim3.1, align 8
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
  %25 = call noundef i32 @cudaLaunchKernel(ptr noundef @_Z39__device_stub__rgb_copy_array_coalescedPiS_, i64 %18, i32 %20, i64 %22, i32 %24, ptr noundef %11, i64 noundef %15, ptr noundef %16)
  br label %26

26:                                               ; preds = %2
  ret void
}

; Function Attrs: noinline norecurse sspstrong uwtable
define dso_local void @_Z42__device_stub__rgb_copy_struct_interleavedP5pixelS0_(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %struct.dim3.1, align 8
  %6 = alloca %struct.dim3.1, align 8
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
  %25 = call noundef i32 @cudaLaunchKernel(ptr noundef @_Z42__device_stub__rgb_copy_struct_interleavedP5pixelS0_, i64 %18, i32 %20, i64 %22, i32 %24, ptr noundef %11, i64 noundef %15, ptr noundef %16)
  br label %26

26:                                               ; preds = %2
  ret void
}

; Function Attrs: noinline norecurse sspstrong uwtable
define dso_local void @_Z40__device_stub__rgb_copy_struct_coalescedP5pixelS0_(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %struct.dim3.1, align 8
  %6 = alloca %struct.dim3.1, align 8
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
  %25 = call noundef i32 @cudaLaunchKernel(ptr noundef @_Z40__device_stub__rgb_copy_struct_coalescedP5pixelS0_, i64 %18, i32 %20, i64 %22, i32 %24, ptr noundef %11, i64 noundef %15, ptr noundef %16)
  br label %26

26:                                               ; preds = %2
  ret void
}

; Function Attrs: noinline norecurse sspstrong uwtable
define dso_local void @_Z36__device_stub__rgb_copy_struct_wholeP5pixelS0_(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %struct.dim3.1, align 8
  %6 = alloca %struct.dim3.1, align 8
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
  %25 = call noundef i32 @cudaLaunchKernel(ptr noundef @_Z36__device_stub__rgb_copy_struct_wholeP5pixelS0_, i64 %18, i32 %20, i64 %22, i32 %24, ptr noundef %11, i64 noundef %15, ptr noundef %16)
  br label %26

26:                                               ; preds = %2
  ret void
}

attributes #0 = { noinline norecurse sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 8]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = !{!"clang version 16.0.6"}
