; ModuleID = 'rgb-cuda-nvptx64-nvidia-cuda-sm_89.bc'
source_filename = "rgb.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t.2 = type { i8 }
%struct.__cuda_builtin_blockDim_t.3 = type { i8 }
%struct.__cuda_builtin_threadIdx_t.4 = type { i8 }
%struct.pixel.5 = type { i32, i32, i32 }

@blockIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockIdx_t.2, align 1
@blockDim = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockDim_t.3, align 1
@threadIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_threadIdx_t.4, align 1

; Function Attrs: convergent mustprogress noinline norecurse nounwind
define dso_local void @_Z26rgb_copy_array_interleavedPiS_(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %9 = mul i32 %7, %8
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %11 = add i32 %9, %10
  store i32 %11, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %12 = load i32, ptr %5, align 4
  %13 = icmp slt i32 %12, 16
  br i1 %13, label %14, label %59

14:                                               ; preds = %2
  %15 = load ptr, ptr %4, align 8
  %16 = load i32, ptr %5, align 4
  %17 = mul nsw i32 3, %16
  %18 = add nsw i32 %17, 0
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i32, ptr %15, i64 %19
  %21 = load i32, ptr %20, align 4
  %22 = load ptr, ptr %3, align 8
  %23 = load i32, ptr %5, align 4
  %24 = mul nsw i32 3, %23
  %25 = add nsw i32 %24, 0
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, ptr %22, i64 %26
  store i32 %21, ptr %27, align 4
  %28 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %29 = icmp ult i32 %28, 10
  br i1 %29, label %30, label %31

30:                                               ; preds = %14
  store i32 1, ptr %6, align 4
  br label %32

31:                                               ; preds = %14
  store i32 2, ptr %6, align 4
  br label %32

32:                                               ; preds = %31, %30
  %33 = load ptr, ptr %4, align 8
  %34 = load i32, ptr %5, align 4
  %35 = mul nsw i32 3, %34
  %36 = add nsw i32 %35, 1
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, ptr %33, i64 %37
  %39 = load i32, ptr %38, align 4
  %40 = load ptr, ptr %3, align 8
  %41 = load i32, ptr %5, align 4
  %42 = mul nsw i32 3, %41
  %43 = add nsw i32 %42, 1
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, ptr %40, i64 %44
  store i32 %39, ptr %45, align 4
  %46 = load ptr, ptr %4, align 8
  %47 = load i32, ptr %5, align 4
  %48 = mul nsw i32 3, %47
  %49 = add nsw i32 %48, 2
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, ptr %46, i64 %50
  %52 = load i32, ptr %51, align 4
  %53 = load ptr, ptr %3, align 8
  %54 = load i32, ptr %5, align 4
  %55 = mul nsw i32 3, %54
  %56 = add nsw i32 %55, 2
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, ptr %53, i64 %57
  store i32 %52, ptr %58, align 4
  br label %59

59:                                               ; preds = %32, %2
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind
define dso_local void @_Z24rgb_copy_array_coalescedPiS_(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %8 = mul i32 %6, %7
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %10 = add i32 %8, %9
  store i32 %10, ptr %5, align 4
  %11 = load ptr, ptr %4, align 8
  %12 = load i32, ptr %5, align 4
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %14 = mul i32 0, %13
  %15 = add i32 %12, %14
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds i32, ptr %11, i64 %16
  %18 = load i32, ptr %17, align 4
  %19 = load ptr, ptr %3, align 8
  %20 = load i32, ptr %5, align 4
  %21 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %22 = mul i32 0, %21
  %23 = add i32 %20, %22
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds i32, ptr %19, i64 %24
  store i32 %18, ptr %25, align 4
  %26 = load ptr, ptr %4, align 8
  %27 = load i32, ptr %5, align 4
  %28 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %29 = mul i32 1, %28
  %30 = add i32 %27, %29
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds i32, ptr %26, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = load ptr, ptr %3, align 8
  %35 = load i32, ptr %5, align 4
  %36 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %37 = mul i32 1, %36
  %38 = add i32 %35, %37
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds i32, ptr %34, i64 %39
  store i32 %33, ptr %40, align 4
  %41 = load ptr, ptr %4, align 8
  %42 = load i32, ptr %5, align 4
  %43 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %44 = mul i32 2, %43
  %45 = add i32 %42, %44
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds i32, ptr %41, i64 %46
  %48 = load i32, ptr %47, align 4
  %49 = load ptr, ptr %3, align 8
  %50 = load i32, ptr %5, align 4
  %51 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %52 = mul i32 2, %51
  %53 = add i32 %50, %52
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds i32, ptr %49, i64 %54
  store i32 %48, ptr %55, align 4
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind
define dso_local void @_Z27rgb_copy_struct_interleavedP5pixelS0_(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %7 = zext i32 %6 to i64
  %8 = getelementptr inbounds %struct.pixel.5, ptr %5, i64 %7
  %9 = getelementptr inbounds %struct.pixel.5, ptr %8, i32 0, i32 0
  %10 = load i32, ptr %9, align 4
  %11 = load ptr, ptr %3, align 8
  %12 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds %struct.pixel.5, ptr %11, i64 %13
  %15 = getelementptr inbounds %struct.pixel.5, ptr %14, i32 0, i32 0
  store i32 %10, ptr %15, align 4
  %16 = load ptr, ptr %4, align 8
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds %struct.pixel.5, ptr %16, i64 %18
  %20 = getelementptr inbounds %struct.pixel.5, ptr %19, i32 0, i32 1
  %21 = load i32, ptr %20, align 4
  %22 = load ptr, ptr %3, align 8
  %23 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds %struct.pixel.5, ptr %22, i64 %24
  %26 = getelementptr inbounds %struct.pixel.5, ptr %25, i32 0, i32 1
  store i32 %21, ptr %26, align 4
  %27 = load ptr, ptr %4, align 8
  %28 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds %struct.pixel.5, ptr %27, i64 %29
  %31 = getelementptr inbounds %struct.pixel.5, ptr %30, i32 0, i32 2
  %32 = load i32, ptr %31, align 4
  %33 = load ptr, ptr %3, align 8
  %34 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds %struct.pixel.5, ptr %33, i64 %35
  %37 = getelementptr inbounds %struct.pixel.5, ptr %36, i32 0, i32 2
  store i32 %32, ptr %37, align 4
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind
define dso_local void @_Z25rgb_copy_struct_coalescedP5pixelS0_(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %4, align 8
  store ptr %7, ptr %5, align 8
  %8 = load ptr, ptr %3, align 8
  store ptr %8, ptr %6, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %11 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %12 = mul i32 0, %11
  %13 = add i32 %10, %12
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds i32, ptr %9, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = load ptr, ptr %6, align 8
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %19 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %20 = mul i32 0, %19
  %21 = add i32 %18, %20
  %22 = zext i32 %21 to i64
  %23 = getelementptr inbounds i32, ptr %17, i64 %22
  store i32 %16, ptr %23, align 4
  %24 = load ptr, ptr %5, align 8
  %25 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %26 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %27 = mul i32 1, %26
  %28 = add i32 %25, %27
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i32, ptr %24, i64 %29
  %31 = load i32, ptr %30, align 4
  %32 = load ptr, ptr %6, align 8
  %33 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %34 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %35 = mul i32 1, %34
  %36 = add i32 %33, %35
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds i32, ptr %32, i64 %37
  store i32 %31, ptr %38, align 4
  %39 = load ptr, ptr %5, align 8
  %40 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %41 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %42 = mul i32 2, %41
  %43 = add i32 %40, %42
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds i32, ptr %39, i64 %44
  %46 = load i32, ptr %45, align 4
  %47 = load ptr, ptr %6, align 8
  %48 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %49 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %50 = mul i32 2, %49
  %51 = add i32 %48, %50
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds i32, ptr %47, i64 %52
  store i32 %46, ptr %53, align 4
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind
define dso_local void @_Z21rgb_copy_struct_wholeP5pixelS0_(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %8 = mul i32 %6, %7
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %10 = add i32 %8, %9
  store i32 %10, ptr %5, align 4
  %11 = load ptr, ptr %4, align 8
  %12 = load i32, ptr %5, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds %struct.pixel.5, ptr %11, i64 %13
  %15 = load ptr, ptr %3, align 8
  %16 = load i32, ptr %5, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %struct.pixel.5, ptr %15, i64 %17
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %18, ptr align 4 %14, i64 12, i1 false)
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2

attributes #0 = { convergent mustprogress noinline norecurse nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_89" "target-features"="+ptx78,+sm_89" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2, !3}
!nvvm.annotations = !{!4, !5, !6, !7, !8}
!llvm.ident = !{!9, !10}
!nvvmir.version = !{!11}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 8]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{ptr @_Z26rgb_copy_array_interleavedPiS_, !"kernel", i32 1}
!5 = !{ptr @_Z24rgb_copy_array_coalescedPiS_, !"kernel", i32 1}
!6 = !{ptr @_Z27rgb_copy_struct_interleavedP5pixelS0_, !"kernel", i32 1}
!7 = !{ptr @_Z25rgb_copy_struct_coalescedP5pixelS0_, !"kernel", i32 1}
!8 = !{ptr @_Z21rgb_copy_struct_wholeP5pixelS0_, !"kernel", i32 1}
!9 = !{!"clang version 16.0.6"}
!10 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!11 = !{i32 2, i32 0}
