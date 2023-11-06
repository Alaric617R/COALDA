; ModuleID = 'rgb-cuda-nvptx64-nvidia-cuda-sm_89.bc'
source_filename = "rgb.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t.1 = type { i8 }
%struct.__cuda_builtin_blockDim_t.2 = type { i8 }
%struct.__cuda_builtin_threadIdx_t.3 = type { i8 }

@blockIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockIdx_t.1, align 1
@blockDim = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockDim_t.2, align 1
@threadIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_threadIdx_t.3, align 1
@_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src = internal addrspace(3) global [99 x i32] undef, align 4
@_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_dst = internal addrspace(3) global [96 x i32] undef, align 4
@_ZZ26rgb_smem_array_interleavedPiS_iE10valid_tail = internal addrspace(3) global i8 undef, align 1

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
  %13 = add i32 %11, %12
  store i32 %13, ptr %7, align 4
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  store i32 %14, ptr %8, align 4
  %15 = load i32, ptr %8, align 4
  %16 = icmp eq i32 %15, 31
  br i1 %16, label %17, label %23

17:                                               ; preds = %3
  %18 = load i32, ptr %7, align 4
  %19 = add nsw i32 %18, 1
  %20 = load i32, ptr %6, align 4
  %21 = icmp slt i32 %19, %20
  %22 = zext i1 %21 to i8
  store i8 %22, ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE10valid_tail to ptr), align 1
  br label %23

23:                                               ; preds = %17, %3
  %24 = load ptr, ptr %5, align 8
  %25 = load i32, ptr %7, align 4
  %26 = mul nsw i32 3, %25
  %27 = add nsw i32 %26, 0
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, ptr %24, i64 %28
  %30 = load i32, ptr %29, align 4
  %31 = load i32, ptr %8, align 4
  %32 = mul nsw i32 3, %31
  %33 = add nsw i32 %32, 0
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [99 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i64 %34
  store i32 %30, ptr %35, align 4
  %36 = load ptr, ptr %5, align 8
  %37 = load i32, ptr %7, align 4
  %38 = mul nsw i32 3, %37
  %39 = add nsw i32 %38, 1
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, ptr %36, i64 %40
  %42 = load i32, ptr %41, align 4
  %43 = load i32, ptr %8, align 4
  %44 = mul nsw i32 3, %43
  %45 = add nsw i32 %44, 1
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [99 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i64 %46
  store i32 %42, ptr %47, align 4
  %48 = load ptr, ptr %5, align 8
  %49 = load i32, ptr %7, align 4
  %50 = mul nsw i32 3, %49
  %51 = add nsw i32 %50, 2
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i32, ptr %48, i64 %52
  %54 = load i32, ptr %53, align 4
  %55 = load i32, ptr %8, align 4
  %56 = mul nsw i32 3, %55
  %57 = add nsw i32 %56, 2
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [99 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i64 %58
  store i32 %54, ptr %59, align 4
  %60 = load i8, ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE10valid_tail to ptr), align 1
  %61 = trunc i8 %60 to i1
  br i1 %61, label %62, label %76

62:                                               ; preds = %23
  %63 = load i32, ptr %8, align 4
  %64 = icmp slt i32 %63, 3
  br i1 %64, label %65, label %76

65:                                               ; preds = %62
  %66 = load ptr, ptr %5, align 8
  %67 = load i32, ptr %8, align 4
  %68 = add nsw i32 96, %67
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i32, ptr %66, i64 %69
  %71 = load i32, ptr %70, align 4
  %72 = load i32, ptr %8, align 4
  %73 = add nsw i32 96, %72
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [99 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i64 %74
  store i32 %71, ptr %75, align 4
  br label %76

76:                                               ; preds = %65, %62, %23
  %77 = load i32, ptr %8, align 4
  %78 = mul nsw i32 3, %77
  %79 = add nsw i32 %78, 0
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [99 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i64 %80
  %82 = load i32, ptr %81, align 4
  %83 = load i32, ptr %8, align 4
  %84 = add nsw i32 %83, 1
  %85 = mul nsw i32 3, %84
  %86 = add nsw i32 %85, 0
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [96 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_dst to ptr), i64 0, i64 %87
  %89 = load i32, ptr %88, align 4
  %90 = add nsw i32 %82, %89
  %91 = load i32, ptr %8, align 4
  %92 = mul nsw i32 3, %91
  %93 = add nsw i32 %92, 0
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [96 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_dst to ptr), i64 0, i64 %94
  store i32 %90, ptr %95, align 4
  %96 = load i32, ptr %8, align 4
  %97 = mul nsw i32 3, %96
  %98 = add nsw i32 %97, 1
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [99 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i64 %99
  %101 = load i32, ptr %100, align 4
  %102 = load i32, ptr %8, align 4
  %103 = add nsw i32 %102, 1
  %104 = mul nsw i32 3, %103
  %105 = add nsw i32 %104, 1
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds [96 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_dst to ptr), i64 0, i64 %106
  %108 = load i32, ptr %107, align 4
  %109 = add nsw i32 %101, %108
  %110 = load i32, ptr %8, align 4
  %111 = mul nsw i32 3, %110
  %112 = add nsw i32 %111, 1
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [96 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_dst to ptr), i64 0, i64 %113
  store i32 %109, ptr %114, align 4
  %115 = load i32, ptr %8, align 4
  %116 = mul nsw i32 3, %115
  %117 = add nsw i32 %116, 2
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [99 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i64 %118
  %120 = load i32, ptr %119, align 4
  %121 = load i32, ptr %8, align 4
  %122 = add nsw i32 %121, 1
  %123 = mul nsw i32 3, %122
  %124 = add nsw i32 %123, 2
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds [96 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_dst to ptr), i64 0, i64 %125
  %127 = load i32, ptr %126, align 4
  %128 = add nsw i32 %120, %127
  %129 = load i32, ptr %8, align 4
  %130 = mul nsw i32 3, %129
  %131 = add nsw i32 %130, 2
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds [96 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_dst to ptr), i64 0, i64 %132
  store i32 %128, ptr %133, align 4
  %134 = load i32, ptr %8, align 4
  %135 = mul nsw i32 3, %134
  %136 = add nsw i32 %135, 0
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds [99 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i64 %137
  %139 = load i32, ptr %138, align 4
  %140 = load ptr, ptr %4, align 8
  %141 = load i32, ptr %7, align 4
  %142 = mul nsw i32 3, %141
  %143 = add nsw i32 %142, 0
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds i32, ptr %140, i64 %144
  store i32 %139, ptr %145, align 4
  %146 = load i32, ptr %8, align 4
  %147 = mul nsw i32 3, %146
  %148 = add nsw i32 %147, 1
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds [99 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i64 %149
  %151 = load i32, ptr %150, align 4
  %152 = load ptr, ptr %4, align 8
  %153 = load i32, ptr %7, align 4
  %154 = mul nsw i32 3, %153
  %155 = add nsw i32 %154, 1
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds i32, ptr %152, i64 %156
  store i32 %151, ptr %157, align 4
  %158 = load i32, ptr %8, align 4
  %159 = mul nsw i32 3, %158
  %160 = add nsw i32 %159, 2
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds [99 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i64 %161
  %163 = load i32, ptr %162, align 4
  %164 = load ptr, ptr %4, align 8
  %165 = load i32, ptr %7, align 4
  %166 = mul nsw i32 3, %165
  %167 = add nsw i32 %166, 2
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds i32, ptr %164, i64 %168
  store i32 %163, ptr %169, align 4
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { convergent mustprogress noinline norecurse nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_89" "target-features"="+ptx78,+sm_89" }
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
