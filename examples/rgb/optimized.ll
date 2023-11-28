; ModuleID = 'optimized.bc'
source_filename = "rgb.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_blockDim_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }

@blockIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@blockDim = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockDim_t, align 1
@threadIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src = internal addrspace(3) global [99 x i32] undef, align 4
@_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_dst = internal addrspace(3) global [96 x i32] undef, align 4

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
  %12 = load i32, ptr %5, align 4
  store i32 %12, ptr %6, align 4
  %13 = load ptr, ptr %4, align 8
  %14 = load i32, ptr %5, align 4
  %15 = mul nsw i32 3, %14
  %16 = add nsw i32 %15, 0
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i32, ptr %13, i64 %17
  %19 = load i32, ptr %18, align 4
  %20 = load ptr, ptr %3, align 8
  %21 = load i32, ptr %5, align 4
  %22 = mul nsw i32 3, %21
  %23 = add nsw i32 %22, 0
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i32, ptr %20, i64 %24
  store i32 %19, ptr %25, align 4
  %26 = load ptr, ptr %4, align 8
  %27 = load i32, ptr %5, align 4
  %28 = mul nsw i32 3, %27
  %29 = add nsw i32 %28, 1
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, ptr %26, i64 %30
  %32 = load i32, ptr %31, align 4
  %33 = load ptr, ptr %3, align 8
  %34 = load i32, ptr %5, align 4
  %35 = mul nsw i32 3, %34
  %36 = add nsw i32 %35, 1
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, ptr %33, i64 %37
  store i32 %32, ptr %38, align 4
  %39 = load ptr, ptr %4, align 8
  %40 = load i32, ptr %5, align 4
  %41 = mul nsw i32 3, %40
  %42 = add nsw i32 %41, 2
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, ptr %39, i64 %43
  %45 = load i32, ptr %44, align 4
  %46 = load ptr, ptr %3, align 8
  %47 = load i32, ptr %5, align 4
  %48 = mul nsw i32 3, %47
  %49 = add nsw i32 %48, 2
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, ptr %46, i64 %50
  store i32 %45, ptr %51, align 4
  %52 = load i32, ptr %6, align 4
  %53 = icmp sgt i32 %52, 10
  br i1 %53, label %54, label %57

54:                                               ; preds = %2
  %55 = load i32, ptr %6, align 4
  %56 = mul nsw i32 %55, 2
  store i32 %56, ptr %6, align 4
  br label %57

57:                                               ; preds = %54, %2
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
define dso_local void @_Z26rgb_smem_array_interleavedPiS_i(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %11 = mul i32 %9, %10
  %12 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %multDimIndex = mul i32 %10, %9
  %GlobalTID = add i32 %multDimIndex, %12
  %13 = add i32 %11, %12
  store i32 %13, ptr %7, align 4
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  store i32 %14, ptr %8, align 4
  %15 = load ptr, ptr %5, align 8
  %16 = load i32, ptr %7, align 4
  %17 = mul nsw i32 3, %16
  %18 = add nsw i32 %17, 0
  %19 = sext i32 %18 to i64
  %valLoadNewOffsetBase1 = add i32 %GlobalTID, %10
  %valLoadNewOffsetWithOffset1 = add i32 %valLoadNewOffsetBase1, 0
  %20 = getelementptr inbounds i32, ptr %15, i32 %valLoadNewOffsetWithOffset1
  %21 = load i32, ptr %20, align 4
  %22 = load i32, ptr %8, align 4
  %23 = mul nsw i32 3, %22
  %24 = add nsw i32 %23, 0
  %25 = sext i32 %24 to i64
  %storePtrGEPNewOffset1 = add i32 %12, %10
  %storePtrGEPNewOffset11 = add i32 %storePtrGEPNewOffset1, 0
  %26 = getelementptr inbounds [99 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i32 %storePtrGEPNewOffset11
  store i32 %21, ptr %26, align 4
  %27 = load ptr, ptr %5, align 8
  %28 = load i32, ptr %7, align 4
  %29 = mul nsw i32 3, %28
  %30 = add nsw i32 %29, 1
  %31 = sext i32 %30 to i64
  %valLoadNewOffsetBase2 = add i32 %GlobalTID, %10
  %valLoadNewOffsetWithOffset2 = add i32 %valLoadNewOffsetBase2, 1
  %32 = getelementptr inbounds i32, ptr %27, i32 %valLoadNewOffsetWithOffset2
  %33 = load i32, ptr %32, align 4
  %34 = load i32, ptr %8, align 4
  %35 = mul nsw i32 3, %34
  %36 = add nsw i32 %35, 1
  %37 = sext i32 %36 to i64
  %storePtrGEPNewOffset2 = add i32 %12, %10
  %storePtrGEPNewOffset22 = add i32 %storePtrGEPNewOffset2, 1
  %38 = getelementptr inbounds [99 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i32 %storePtrGEPNewOffset22
  store i32 %33, ptr %38, align 4
  %39 = load ptr, ptr %5, align 8
  %40 = load i32, ptr %7, align 4
  %41 = mul nsw i32 3, %40
  %42 = add nsw i32 %41, 2
  %43 = sext i32 %42 to i64
  %valLoadNewOffsetBase3 = add i32 %GlobalTID, %10
  %valLoadNewOffsetWithOffset3 = add i32 %valLoadNewOffsetBase3, 2
  %44 = getelementptr inbounds i32, ptr %39, i32 %valLoadNewOffsetWithOffset3
  %45 = load i32, ptr %44, align 4
  %46 = load i32, ptr %8, align 4
  %47 = mul nsw i32 3, %46
  %48 = add nsw i32 %47, 2
  %49 = sext i32 %48 to i64
  %storePtrGEPNewOffset3 = add i32 %12, %10
  %storePtrGEPNewOffset33 = add i32 %storePtrGEPNewOffset3, 2
  %50 = getelementptr inbounds [99 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i32 %storePtrGEPNewOffset33
  store i32 %45, ptr %50, align 4
  %51 = load i32, ptr %8, align 4
  %52 = icmp slt i32 %51, 3
  br i1 %52, label %53, label %64

53:                                               ; preds = %3
  %54 = load ptr, ptr %5, align 8
  %55 = load i32, ptr %8, align 4
  %56 = add nsw i32 96, %55
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, ptr %54, i64 %57
  %59 = load i32, ptr %58, align 4
  %60 = load i32, ptr %8, align 4
  %61 = add nsw i32 96, %60
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [99 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i64 %62
  store i32 %59, ptr %63, align 4
  br label %64

64:                                               ; preds = %53, %3
  %65 = load i32, ptr %8, align 4
  %66 = mul nsw i32 3, %65
  %67 = add nsw i32 %66, 0
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [99 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i64 %68
  %70 = load i32, ptr %69, align 4
  %71 = load i32, ptr %8, align 4
  %72 = add nsw i32 %71, 1
  %73 = mul nsw i32 3, %72
  %74 = add nsw i32 %73, 0
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [99 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i64 %75
  %77 = load i32, ptr %76, align 4
  %78 = add nsw i32 %70, %77
  %79 = ashr i32 %78, 1
  %80 = load i32, ptr %8, align 4
  %81 = mul nsw i32 3, %80
  %82 = add nsw i32 %81, 0
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [96 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_dst to ptr), i64 0, i64 %83
  store i32 %79, ptr %84, align 4
  %85 = load i32, ptr %8, align 4
  %86 = mul nsw i32 3, %85
  %87 = add nsw i32 %86, 1
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [99 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i64 %88
  %90 = load i32, ptr %89, align 4
  %91 = load i32, ptr %8, align 4
  %92 = add nsw i32 %91, 1
  %93 = mul nsw i32 3, %92
  %94 = add nsw i32 %93, 1
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [99 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i64 %95
  %97 = load i32, ptr %96, align 4
  %98 = add nsw i32 %90, %97
  %99 = ashr i32 %98, 1
  %100 = load i32, ptr %8, align 4
  %101 = mul nsw i32 3, %100
  %102 = add nsw i32 %101, 1
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [96 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_dst to ptr), i64 0, i64 %103
  store i32 %99, ptr %104, align 4
  %105 = load i32, ptr %8, align 4
  %106 = mul nsw i32 3, %105
  %107 = add nsw i32 %106, 2
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [99 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i64 %108
  %110 = load i32, ptr %109, align 4
  %111 = load i32, ptr %8, align 4
  %112 = add nsw i32 %111, 1
  %113 = mul nsw i32 3, %112
  %114 = add nsw i32 %113, 2
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [99 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i64 %115
  %117 = load i32, ptr %116, align 4
  %118 = add nsw i32 %110, %117
  %119 = ashr i32 %118, 1
  %120 = load i32, ptr %8, align 4
  %121 = mul nsw i32 3, %120
  %122 = add nsw i32 %121, 2
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [96 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_dst to ptr), i64 0, i64 %123
  store i32 %119, ptr %124, align 4
  %125 = load i32, ptr %8, align 4
  %126 = mul nsw i32 3, %125
  %127 = add nsw i32 %126, 0
  %128 = sext i32 %127 to i64
  %valLoadNewOffsetBase14 = add i32 %12, %10
  %valLoadNewOffsetWithOffset15 = add i32 %valLoadNewOffsetBase14, 0
  %129 = getelementptr inbounds [96 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_dst to ptr), i64 0, i32 %valLoadNewOffsetWithOffset15
  %130 = load i32, ptr %129, align 4
  %131 = load ptr, ptr %4, align 8
  %132 = load i32, ptr %7, align 4
  %133 = mul nsw i32 3, %132
  %134 = add nsw i32 %133, 0
  %135 = sext i32 %134 to i64
  %storePtrGEPNewOffset16 = add i32 %GlobalTID, %10
  %storePtrGEPNewOffset17 = add i32 %storePtrGEPNewOffset16, 0
  %136 = getelementptr inbounds i32, ptr %131, i32 %storePtrGEPNewOffset17
  store i32 %130, ptr %136, align 4
  %137 = load i32, ptr %8, align 4
  %138 = mul nsw i32 3, %137
  %139 = add nsw i32 %138, 1
  %140 = sext i32 %139 to i64
  %valLoadNewOffsetBase28 = add i32 %12, %10
  %valLoadNewOffsetWithOffset29 = add i32 %valLoadNewOffsetBase28, 1
  %141 = getelementptr inbounds [96 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_dst to ptr), i64 0, i32 %valLoadNewOffsetWithOffset29
  %142 = load i32, ptr %141, align 4
  %143 = load ptr, ptr %4, align 8
  %144 = load i32, ptr %7, align 4
  %145 = mul nsw i32 3, %144
  %146 = add nsw i32 %145, 1
  %147 = sext i32 %146 to i64
  %storePtrGEPNewOffset210 = add i32 %GlobalTID, %10
  %storePtrGEPNewOffset211 = add i32 %storePtrGEPNewOffset210, 1
  %148 = getelementptr inbounds i32, ptr %143, i32 %storePtrGEPNewOffset211
  store i32 %142, ptr %148, align 4
  %149 = load i32, ptr %8, align 4
  %150 = mul nsw i32 3, %149
  %151 = add nsw i32 %150, 2
  %152 = sext i32 %151 to i64
  %valLoadNewOffsetBase312 = add i32 %12, %10
  %valLoadNewOffsetWithOffset313 = add i32 %valLoadNewOffsetBase312, 2
  %153 = getelementptr inbounds [96 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_dst to ptr), i64 0, i32 %valLoadNewOffsetWithOffset313
  %154 = load i32, ptr %153, align 4
  %155 = load ptr, ptr %4, align 8
  %156 = load i32, ptr %7, align 4
  %157 = mul nsw i32 3, %156
  %158 = add nsw i32 %157, 2
  %159 = sext i32 %158 to i64
  %storePtrGEPNewOffset314 = add i32 %GlobalTID, %10
  %storePtrGEPNewOffset315 = add i32 %storePtrGEPNewOffset314, 2
  %160 = getelementptr inbounds i32, ptr %155, i32 %storePtrGEPNewOffset315
  store i32 %154, ptr %160, align 4
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { convergent mustprogress noinline norecurse nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_70" "target-features"="+ptx78,+sm_70" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2, !3}
!nvvm.annotations = !{!4, !5, !6}
!llvm.ident = !{!7, !8}
!nvvmir.version = !{!9}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 8]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{ptr @_Z26rgb_copy_array_interleavedPiS_, !"kernel", i32 1}
!5 = !{ptr @_Z24rgb_copy_array_coalescedPiS_, !"kernel", i32 1}
!6 = !{ptr @_Z26rgb_smem_array_interleavedPiS_i, !"kernel", i32 1}
!7 = !{!"clang version 16.0.6"}
!8 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!9 = !{i32 2, i32 0}
