; ModuleID = 'rgb_device.bc'
source_filename = "rgb.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_blockDim_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }

@blockIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@blockDim = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockDim_t, align 1
@threadIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src = internal addrspace(3) global [1539 x i32] undef, align 4
@_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_dst = internal addrspace(3) global [1536 x i32] undef, align 4
@_ZZ23rgb_increase_brightnessPiS_ifE14pixel_smem_src = internal addrspace(3) global [1536 x i32] undef, align 4
@_ZZ23rgb_increase_brightnessPiS_ifE14pixel_smem_dst = internal addrspace(3) global [1536 x i32] undef, align 4
@_ZZ33rgb_increase_brightness_coalescedPiS_ifE14pixel_smem_src = internal addrspace(3) global [1536 x i32] undef, align 4
@_ZZ33rgb_increase_brightness_coalescedPiS_ifE14pixel_smem_dst = internal addrspace(3) global [1536 x i32] undef, align 4
@_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_src = internal addrspace(3) global [6144 x i32] undef, align 4
@_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_dst = internal addrspace(3) global [6144 x i32] undef, align 4
@_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_src = internal addrspace(3) global [6144 x i32] undef, align 4
@_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_dst = internal addrspace(3) global [6144 x i32] undef, align 4

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
  %7 = mul i32 3, %6
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %9 = mul i32 %7, %8
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %11 = add i32 %9, %10
  store i32 %11, ptr %5, align 4
  %12 = load ptr, ptr %4, align 8
  %13 = load i32, ptr %5, align 4
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %15 = mul i32 0, %14
  %16 = add i32 %13, %15
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds i32, ptr %12, i64 %17
  %19 = load i32, ptr %18, align 4
  %20 = load ptr, ptr %3, align 8
  %21 = load i32, ptr %5, align 4
  %22 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %23 = mul i32 0, %22
  %24 = add i32 %21, %23
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds i32, ptr %20, i64 %25
  store i32 %19, ptr %26, align 4
  %27 = load ptr, ptr %4, align 8
  %28 = load i32, ptr %5, align 4
  %29 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %30 = mul i32 1, %29
  %31 = add i32 %28, %30
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds i32, ptr %27, i64 %32
  %34 = load i32, ptr %33, align 4
  %35 = load ptr, ptr %3, align 8
  %36 = load i32, ptr %5, align 4
  %37 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %38 = mul i32 1, %37
  %39 = add i32 %36, %38
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds i32, ptr %35, i64 %40
  store i32 %34, ptr %41, align 4
  %42 = load ptr, ptr %4, align 8
  %43 = load i32, ptr %5, align 4
  %44 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %45 = mul i32 2, %44
  %46 = add i32 %43, %45
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds i32, ptr %42, i64 %47
  %49 = load i32, ptr %48, align 4
  %50 = load ptr, ptr %3, align 8
  %51 = load i32, ptr %5, align 4
  %52 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %53 = mul i32 2, %52
  %54 = add i32 %51, %53
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds i32, ptr %50, i64 %55
  store i32 %49, ptr %56, align 4
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
  %15 = load ptr, ptr %5, align 8
  %16 = load i32, ptr %7, align 4
  %17 = mul nsw i32 3, %16
  %18 = add nsw i32 %17, 0
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i32, ptr %15, i64 %19
  %21 = load i32, ptr %20, align 4
  %22 = load i32, ptr %8, align 4
  %23 = mul nsw i32 3, %22
  %24 = add nsw i32 %23, 0
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [1539 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i64 %25
  store i32 %21, ptr %26, align 4
  %27 = load ptr, ptr %5, align 8
  %28 = load i32, ptr %7, align 4
  %29 = mul nsw i32 3, %28
  %30 = add nsw i32 %29, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, ptr %27, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = load i32, ptr %8, align 4
  %35 = mul nsw i32 3, %34
  %36 = add nsw i32 %35, 1
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [1539 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i64 %37
  store i32 %33, ptr %38, align 4
  %39 = load ptr, ptr %5, align 8
  %40 = load i32, ptr %7, align 4
  %41 = mul nsw i32 3, %40
  %42 = add nsw i32 %41, 2
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, ptr %39, i64 %43
  %45 = load i32, ptr %44, align 4
  %46 = load i32, ptr %8, align 4
  %47 = mul nsw i32 3, %46
  %48 = add nsw i32 %47, 2
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [1539 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i64 %49
  store i32 %45, ptr %50, align 4
  %51 = load i32, ptr %8, align 4
  %52 = icmp slt i32 %51, 3
  br i1 %52, label %53, label %64

53:                                               ; preds = %3
  %54 = load ptr, ptr %5, align 8
  %55 = load i32, ptr %8, align 4
  %56 = add nsw i32 1536, %55
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, ptr %54, i64 %57
  %59 = load i32, ptr %58, align 4
  %60 = load i32, ptr %8, align 4
  %61 = add nsw i32 1536, %60
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [1539 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i64 %62
  store i32 %59, ptr %63, align 4
  br label %64

64:                                               ; preds = %53, %3
  %65 = load i32, ptr %8, align 4
  %66 = mul nsw i32 3, %65
  %67 = add nsw i32 %66, 0
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [1539 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i64 %68
  %70 = load i32, ptr %69, align 4
  %71 = load i32, ptr %8, align 4
  %72 = add nsw i32 %71, 1
  %73 = mul nsw i32 3, %72
  %74 = add nsw i32 %73, 0
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [1539 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i64 %75
  %77 = load i32, ptr %76, align 4
  %78 = add nsw i32 %70, %77
  %79 = ashr i32 %78, 1
  %80 = load i32, ptr %8, align 4
  %81 = mul nsw i32 3, %80
  %82 = add nsw i32 %81, 0
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_dst to ptr), i64 0, i64 %83
  store i32 %79, ptr %84, align 4
  %85 = load i32, ptr %8, align 4
  %86 = mul nsw i32 3, %85
  %87 = add nsw i32 %86, 1
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [1539 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i64 %88
  %90 = load i32, ptr %89, align 4
  %91 = load i32, ptr %8, align 4
  %92 = add nsw i32 %91, 1
  %93 = mul nsw i32 3, %92
  %94 = add nsw i32 %93, 1
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [1539 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i64 %95
  %97 = load i32, ptr %96, align 4
  %98 = add nsw i32 %90, %97
  %99 = ashr i32 %98, 1
  %100 = load i32, ptr %8, align 4
  %101 = mul nsw i32 3, %100
  %102 = add nsw i32 %101, 1
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_dst to ptr), i64 0, i64 %103
  store i32 %99, ptr %104, align 4
  %105 = load i32, ptr %8, align 4
  %106 = mul nsw i32 3, %105
  %107 = add nsw i32 %106, 2
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [1539 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i64 %108
  %110 = load i32, ptr %109, align 4
  %111 = load i32, ptr %8, align 4
  %112 = add nsw i32 %111, 1
  %113 = mul nsw i32 3, %112
  %114 = add nsw i32 %113, 2
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [1539 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_src to ptr), i64 0, i64 %115
  %117 = load i32, ptr %116, align 4
  %118 = add nsw i32 %110, %117
  %119 = ashr i32 %118, 1
  %120 = load i32, ptr %8, align 4
  %121 = mul nsw i32 3, %120
  %122 = add nsw i32 %121, 2
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_dst to ptr), i64 0, i64 %123
  store i32 %119, ptr %124, align 4
  call void @llvm.nvvm.barrier0()
  %125 = load i32, ptr %8, align 4
  %126 = mul nsw i32 3, %125
  %127 = add nsw i32 %126, 0
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_dst to ptr), i64 0, i64 %128
  %130 = load i32, ptr %129, align 4
  %131 = load ptr, ptr %4, align 8
  %132 = load i32, ptr %7, align 4
  %133 = mul nsw i32 3, %132
  %134 = add nsw i32 %133, 0
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i32, ptr %131, i64 %135
  store i32 %130, ptr %136, align 4
  call void @llvm.nvvm.barrier0()
  %137 = load i32, ptr %8, align 4
  %138 = mul nsw i32 3, %137
  %139 = add nsw i32 %138, 1
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_dst to ptr), i64 0, i64 %140
  %142 = load i32, ptr %141, align 4
  %143 = load ptr, ptr %4, align 8
  %144 = load i32, ptr %7, align 4
  %145 = mul nsw i32 3, %144
  %146 = add nsw i32 %145, 1
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds i32, ptr %143, i64 %147
  store i32 %142, ptr %148, align 4
  call void @llvm.nvvm.barrier0()
  %149 = load i32, ptr %8, align 4
  %150 = mul nsw i32 3, %149
  %151 = add nsw i32 %150, 2
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_dst to ptr), i64 0, i64 %152
  %154 = load i32, ptr %153, align 4
  %155 = load ptr, ptr %4, align 8
  %156 = load i32, ptr %7, align 4
  %157 = mul nsw i32 3, %156
  %158 = add nsw i32 %157, 2
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds i32, ptr %155, i64 %159
  store i32 %154, ptr %160, align 4
  ret void
}

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #1

; Function Attrs: convergent noinline norecurse nounwind
define dso_local void @_Z23rgb_increase_brightnessPiS_if(ptr noundef %0, ptr noundef %1, i32 noundef %2, float noundef %3) #2 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca float, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store ptr %0, ptr %11, align 8
  store ptr %1, ptr %12, align 8
  store i32 %2, ptr %13, align 4
  store float %3, ptr %14, align 4
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %19 = mul i32 %17, %18
  %20 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %21 = add i32 %19, %20
  store i32 %21, ptr %15, align 4
  %22 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  store i32 %22, ptr %16, align 4
  %23 = load ptr, ptr %12, align 8
  %24 = load i32, ptr %15, align 4
  %25 = mul nsw i32 3, %24
  %26 = add nsw i32 %25, 0
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, ptr %23, i64 %27
  %29 = load i32, ptr %28, align 4
  %30 = load i32, ptr %16, align 4
  %31 = mul nsw i32 3, %30
  %32 = add nsw i32 %31, 0
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ23rgb_increase_brightnessPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %33
  store i32 %29, ptr %34, align 4
  call void @llvm.nvvm.barrier0()
  %35 = load ptr, ptr %12, align 8
  %36 = load i32, ptr %15, align 4
  %37 = mul nsw i32 3, %36
  %38 = add nsw i32 %37, 1
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, ptr %35, i64 %39
  %41 = load i32, ptr %40, align 4
  %42 = load i32, ptr %16, align 4
  %43 = mul nsw i32 3, %42
  %44 = add nsw i32 %43, 1
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ23rgb_increase_brightnessPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %45
  store i32 %41, ptr %46, align 4
  call void @llvm.nvvm.barrier0()
  %47 = load ptr, ptr %12, align 8
  %48 = load i32, ptr %15, align 4
  %49 = mul nsw i32 3, %48
  %50 = add nsw i32 %49, 2
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, ptr %47, i64 %51
  %53 = load i32, ptr %52, align 4
  %54 = load i32, ptr %16, align 4
  %55 = mul nsw i32 3, %54
  %56 = add nsw i32 %55, 2
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ23rgb_increase_brightnessPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %57
  store i32 %53, ptr %58, align 4
  call void @llvm.nvvm.barrier0()
  %59 = load float, ptr %14, align 4
  %60 = load i32, ptr %16, align 4
  %61 = mul nsw i32 3, %60
  %62 = add nsw i32 %61, 0
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ23rgb_increase_brightnessPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %63
  %65 = load i32, ptr %64, align 4
  %66 = sitofp i32 %65 to float
  %67 = fmul contract float %59, %66
  %68 = fptosi float %67 to i32
  store i32 255, ptr %5, align 4
  store i32 %68, ptr %6, align 4
  %69 = load i32, ptr %5, align 4
  %70 = load i32, ptr %6, align 4
  %71 = icmp sle i32 %69, %70
  %72 = select i1 %71, i32 %69, i32 %70
  %73 = load i32, ptr %16, align 4
  %74 = mul nsw i32 3, %73
  %75 = add nsw i32 %74, 0
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ23rgb_increase_brightnessPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %76
  store i32 %72, ptr %77, align 4
  %78 = load float, ptr %14, align 4
  %79 = load i32, ptr %16, align 4
  %80 = mul nsw i32 3, %79
  %81 = add nsw i32 %80, 1
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ23rgb_increase_brightnessPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %82
  %84 = load i32, ptr %83, align 4
  %85 = sitofp i32 %84 to float
  %86 = fmul contract float %78, %85
  %87 = fptosi float %86 to i32
  store i32 255, ptr %7, align 4
  store i32 %87, ptr %8, align 4
  %88 = load i32, ptr %7, align 4
  %89 = load i32, ptr %8, align 4
  %90 = icmp sle i32 %88, %89
  %91 = select i1 %90, i32 %88, i32 %89
  %92 = load i32, ptr %16, align 4
  %93 = mul nsw i32 3, %92
  %94 = add nsw i32 %93, 1
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ23rgb_increase_brightnessPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %95
  store i32 %91, ptr %96, align 4
  %97 = load float, ptr %14, align 4
  %98 = load i32, ptr %16, align 4
  %99 = mul nsw i32 3, %98
  %100 = add nsw i32 %99, 2
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ23rgb_increase_brightnessPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %101
  %103 = load i32, ptr %102, align 4
  %104 = sitofp i32 %103 to float
  %105 = fmul contract float %97, %104
  %106 = fptosi float %105 to i32
  store i32 255, ptr %9, align 4
  store i32 %106, ptr %10, align 4
  %107 = load i32, ptr %9, align 4
  %108 = load i32, ptr %10, align 4
  %109 = icmp sle i32 %107, %108
  %110 = select i1 %109, i32 %107, i32 %108
  %111 = load i32, ptr %16, align 4
  %112 = mul nsw i32 3, %111
  %113 = add nsw i32 %112, 2
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ23rgb_increase_brightnessPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %114
  store i32 %110, ptr %115, align 4
  call void @llvm.nvvm.barrier0()
  %116 = load i32, ptr %16, align 4
  %117 = mul nsw i32 3, %116
  %118 = add nsw i32 %117, 0
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ23rgb_increase_brightnessPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %119
  %121 = load i32, ptr %120, align 4
  %122 = load ptr, ptr %11, align 8
  %123 = load i32, ptr %15, align 4
  %124 = mul nsw i32 3, %123
  %125 = add nsw i32 %124, 0
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds i32, ptr %122, i64 %126
  store i32 %121, ptr %127, align 4
  call void @llvm.nvvm.barrier0()
  %128 = load i32, ptr %16, align 4
  %129 = mul nsw i32 3, %128
  %130 = add nsw i32 %129, 1
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ23rgb_increase_brightnessPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %131
  %133 = load i32, ptr %132, align 4
  %134 = load ptr, ptr %11, align 8
  %135 = load i32, ptr %15, align 4
  %136 = mul nsw i32 3, %135
  %137 = add nsw i32 %136, 1
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds i32, ptr %134, i64 %138
  store i32 %133, ptr %139, align 4
  call void @llvm.nvvm.barrier0()
  %140 = load i32, ptr %16, align 4
  %141 = mul nsw i32 3, %140
  %142 = add nsw i32 %141, 2
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ23rgb_increase_brightnessPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %143
  %145 = load i32, ptr %144, align 4
  %146 = load ptr, ptr %11, align 8
  %147 = load i32, ptr %15, align 4
  %148 = mul nsw i32 3, %147
  %149 = add nsw i32 %148, 2
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds i32, ptr %146, i64 %150
  store i32 %145, ptr %151, align 4
  ret void
}

; Function Attrs: convergent noinline norecurse nounwind
define dso_local void @_Z33rgb_increase_brightness_coalescedPiS_if(ptr noundef %0, ptr noundef %1, i32 noundef %2, float noundef %3) #2 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca float, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store ptr %0, ptr %11, align 8
  store ptr %1, ptr %12, align 8
  store i32 %2, ptr %13, align 4
  store float %3, ptr %14, align 4
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %18 = mul i32 3, %17
  %19 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %20 = mul i32 %18, %19
  %21 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %22 = add i32 %20, %21
  store i32 %22, ptr %15, align 4
  %23 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  store i32 %23, ptr %16, align 4
  %24 = load ptr, ptr %12, align 8
  %25 = load i32, ptr %15, align 4
  %26 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %27 = mul i32 0, %26
  %28 = add i32 %25, %27
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i32, ptr %24, i64 %29
  %31 = load i32, ptr %30, align 4
  %32 = load i32, ptr %16, align 4
  %33 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %34 = mul i32 0, %33
  %35 = add i32 %32, %34
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ33rgb_increase_brightness_coalescedPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %36
  store i32 %31, ptr %37, align 4
  call void @llvm.nvvm.barrier0()
  %38 = load ptr, ptr %12, align 8
  %39 = load i32, ptr %15, align 4
  %40 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %41 = mul i32 1, %40
  %42 = add i32 %39, %41
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds i32, ptr %38, i64 %43
  %45 = load i32, ptr %44, align 4
  %46 = load i32, ptr %16, align 4
  %47 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %48 = mul i32 1, %47
  %49 = add i32 %46, %48
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ33rgb_increase_brightness_coalescedPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %50
  store i32 %45, ptr %51, align 4
  call void @llvm.nvvm.barrier0()
  %52 = load ptr, ptr %12, align 8
  %53 = load i32, ptr %15, align 4
  %54 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %55 = mul i32 2, %54
  %56 = add i32 %53, %55
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds i32, ptr %52, i64 %57
  %59 = load i32, ptr %58, align 4
  %60 = load i32, ptr %16, align 4
  %61 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %62 = mul i32 2, %61
  %63 = add i32 %60, %62
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ33rgb_increase_brightness_coalescedPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %64
  store i32 %59, ptr %65, align 4
  call void @llvm.nvvm.barrier0()
  %66 = load float, ptr %14, align 4
  %67 = load i32, ptr %16, align 4
  %68 = mul nsw i32 3, %67
  %69 = add nsw i32 %68, 0
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ33rgb_increase_brightness_coalescedPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %70
  %72 = load i32, ptr %71, align 4
  %73 = sitofp i32 %72 to float
  %74 = fmul contract float %66, %73
  %75 = fptosi float %74 to i32
  store i32 255, ptr %5, align 4
  store i32 %75, ptr %6, align 4
  %76 = load i32, ptr %5, align 4
  %77 = load i32, ptr %6, align 4
  %78 = icmp sle i32 %76, %77
  %79 = select i1 %78, i32 %76, i32 %77
  %80 = load i32, ptr %16, align 4
  %81 = mul nsw i32 3, %80
  %82 = add nsw i32 %81, 0
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ33rgb_increase_brightness_coalescedPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %83
  store i32 %79, ptr %84, align 4
  %85 = load float, ptr %14, align 4
  %86 = load i32, ptr %16, align 4
  %87 = mul nsw i32 3, %86
  %88 = add nsw i32 %87, 1
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ33rgb_increase_brightness_coalescedPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %89
  %91 = load i32, ptr %90, align 4
  %92 = sitofp i32 %91 to float
  %93 = fmul contract float %85, %92
  %94 = fptosi float %93 to i32
  store i32 255, ptr %7, align 4
  store i32 %94, ptr %8, align 4
  %95 = load i32, ptr %7, align 4
  %96 = load i32, ptr %8, align 4
  %97 = icmp sle i32 %95, %96
  %98 = select i1 %97, i32 %95, i32 %96
  %99 = load i32, ptr %16, align 4
  %100 = mul nsw i32 3, %99
  %101 = add nsw i32 %100, 1
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ33rgb_increase_brightness_coalescedPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %102
  store i32 %98, ptr %103, align 4
  %104 = load float, ptr %14, align 4
  %105 = load i32, ptr %16, align 4
  %106 = mul nsw i32 3, %105
  %107 = add nsw i32 %106, 2
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ33rgb_increase_brightness_coalescedPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %108
  %110 = load i32, ptr %109, align 4
  %111 = sitofp i32 %110 to float
  %112 = fmul contract float %104, %111
  %113 = fptosi float %112 to i32
  store i32 255, ptr %9, align 4
  store i32 %113, ptr %10, align 4
  %114 = load i32, ptr %9, align 4
  %115 = load i32, ptr %10, align 4
  %116 = icmp sle i32 %114, %115
  %117 = select i1 %116, i32 %114, i32 %115
  %118 = load i32, ptr %16, align 4
  %119 = mul nsw i32 3, %118
  %120 = add nsw i32 %119, 2
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ33rgb_increase_brightness_coalescedPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %121
  store i32 %117, ptr %122, align 4
  call void @llvm.nvvm.barrier0()
  %123 = load i32, ptr %16, align 4
  %124 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %125 = mul i32 0, %124
  %126 = add i32 %123, %125
  %127 = zext i32 %126 to i64
  %128 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ33rgb_increase_brightness_coalescedPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %127
  %129 = load i32, ptr %128, align 4
  %130 = load ptr, ptr %11, align 8
  %131 = load i32, ptr %15, align 4
  %132 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %133 = mul i32 0, %132
  %134 = add i32 %131, %133
  %135 = zext i32 %134 to i64
  %136 = getelementptr inbounds i32, ptr %130, i64 %135
  store i32 %129, ptr %136, align 4
  call void @llvm.nvvm.barrier0()
  %137 = load i32, ptr %16, align 4
  %138 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %139 = mul i32 1, %138
  %140 = add i32 %137, %139
  %141 = zext i32 %140 to i64
  %142 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ33rgb_increase_brightness_coalescedPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %141
  %143 = load i32, ptr %142, align 4
  %144 = load ptr, ptr %11, align 8
  %145 = load i32, ptr %15, align 4
  %146 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %147 = mul i32 1, %146
  %148 = add i32 %145, %147
  %149 = zext i32 %148 to i64
  %150 = getelementptr inbounds i32, ptr %144, i64 %149
  store i32 %143, ptr %150, align 4
  call void @llvm.nvvm.barrier0()
  %151 = load i32, ptr %16, align 4
  %152 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %153 = mul i32 2, %152
  %154 = add i32 %151, %153
  %155 = zext i32 %154 to i64
  %156 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ33rgb_increase_brightness_coalescedPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %155
  %157 = load i32, ptr %156, align 4
  %158 = load ptr, ptr %11, align 8
  %159 = load i32, ptr %15, align 4
  %160 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %161 = mul i32 2, %160
  %162 = add i32 %159, %161
  %163 = zext i32 %162 to i64
  %164 = getelementptr inbounds i32, ptr %158, i64 %163
  store i32 %157, ptr %164, align 4
  ret void
}

; Function Attrs: convergent noinline norecurse nounwind
define dso_local void @_Z30rgb_increase_brightness_unrollPiS_if(ptr noundef %0, ptr noundef %1, i32 noundef %2, float noundef %3) #2 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca ptr, align 8
  %30 = alloca ptr, align 8
  %31 = alloca i32, align 4
  %32 = alloca float, align 4
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  store ptr %0, ptr %29, align 8
  store ptr %1, ptr %30, align 8
  store i32 %2, ptr %31, align 4
  store float %3, ptr %32, align 4
  %35 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %36 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %37 = mul i32 %35, %36
  %38 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %39 = add i32 %37, %38
  store i32 %39, ptr %33, align 4
  %40 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  store i32 %40, ptr %34, align 4
  %41 = load ptr, ptr %30, align 8
  %42 = load i32, ptr %33, align 4
  %43 = mul nsw i32 12, %42
  %44 = add nsw i32 %43, 0
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, ptr %41, i64 %45
  %47 = load i32, ptr %46, align 4
  %48 = load i32, ptr %34, align 4
  %49 = mul nsw i32 12, %48
  %50 = add nsw i32 %49, 0
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %51
  store i32 %47, ptr %52, align 4
  call void @llvm.nvvm.barrier0()
  %53 = load ptr, ptr %30, align 8
  %54 = load i32, ptr %33, align 4
  %55 = mul nsw i32 12, %54
  %56 = add nsw i32 %55, 1
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, ptr %53, i64 %57
  %59 = load i32, ptr %58, align 4
  %60 = load i32, ptr %34, align 4
  %61 = mul nsw i32 12, %60
  %62 = add nsw i32 %61, 1
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %63
  store i32 %59, ptr %64, align 4
  call void @llvm.nvvm.barrier0()
  %65 = load ptr, ptr %30, align 8
  %66 = load i32, ptr %33, align 4
  %67 = mul nsw i32 12, %66
  %68 = add nsw i32 %67, 2
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i32, ptr %65, i64 %69
  %71 = load i32, ptr %70, align 4
  %72 = load i32, ptr %34, align 4
  %73 = mul nsw i32 12, %72
  %74 = add nsw i32 %73, 2
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %75
  store i32 %71, ptr %76, align 4
  call void @llvm.nvvm.barrier0()
  %77 = load ptr, ptr %30, align 8
  %78 = load i32, ptr %33, align 4
  %79 = mul nsw i32 12, %78
  %80 = add nsw i32 %79, 3
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, ptr %77, i64 %81
  %83 = load i32, ptr %82, align 4
  %84 = load i32, ptr %34, align 4
  %85 = mul nsw i32 12, %84
  %86 = add nsw i32 %85, 3
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %87
  store i32 %83, ptr %88, align 4
  call void @llvm.nvvm.barrier0()
  %89 = load ptr, ptr %30, align 8
  %90 = load i32, ptr %33, align 4
  %91 = mul nsw i32 12, %90
  %92 = add nsw i32 %91, 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i32, ptr %89, i64 %93
  %95 = load i32, ptr %94, align 4
  %96 = load i32, ptr %34, align 4
  %97 = mul nsw i32 12, %96
  %98 = add nsw i32 %97, 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %99
  store i32 %95, ptr %100, align 4
  call void @llvm.nvvm.barrier0()
  %101 = load ptr, ptr %30, align 8
  %102 = load i32, ptr %33, align 4
  %103 = mul nsw i32 12, %102
  %104 = add nsw i32 %103, 5
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i32, ptr %101, i64 %105
  %107 = load i32, ptr %106, align 4
  %108 = load i32, ptr %34, align 4
  %109 = mul nsw i32 12, %108
  %110 = add nsw i32 %109, 5
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %111
  store i32 %107, ptr %112, align 4
  call void @llvm.nvvm.barrier0()
  %113 = load ptr, ptr %30, align 8
  %114 = load i32, ptr %33, align 4
  %115 = mul nsw i32 12, %114
  %116 = add nsw i32 %115, 6
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i32, ptr %113, i64 %117
  %119 = load i32, ptr %118, align 4
  %120 = load i32, ptr %34, align 4
  %121 = mul nsw i32 12, %120
  %122 = add nsw i32 %121, 6
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %123
  store i32 %119, ptr %124, align 4
  call void @llvm.nvvm.barrier0()
  %125 = load ptr, ptr %30, align 8
  %126 = load i32, ptr %33, align 4
  %127 = mul nsw i32 12, %126
  %128 = add nsw i32 %127, 7
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds i32, ptr %125, i64 %129
  %131 = load i32, ptr %130, align 4
  %132 = load i32, ptr %34, align 4
  %133 = mul nsw i32 12, %132
  %134 = add nsw i32 %133, 7
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %135
  store i32 %131, ptr %136, align 4
  call void @llvm.nvvm.barrier0()
  %137 = load ptr, ptr %30, align 8
  %138 = load i32, ptr %33, align 4
  %139 = mul nsw i32 12, %138
  %140 = add nsw i32 %139, 8
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds i32, ptr %137, i64 %141
  %143 = load i32, ptr %142, align 4
  %144 = load i32, ptr %34, align 4
  %145 = mul nsw i32 12, %144
  %146 = add nsw i32 %145, 8
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %147
  store i32 %143, ptr %148, align 4
  call void @llvm.nvvm.barrier0()
  %149 = load ptr, ptr %30, align 8
  %150 = load i32, ptr %33, align 4
  %151 = mul nsw i32 12, %150
  %152 = add nsw i32 %151, 9
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds i32, ptr %149, i64 %153
  %155 = load i32, ptr %154, align 4
  %156 = load i32, ptr %34, align 4
  %157 = mul nsw i32 12, %156
  %158 = add nsw i32 %157, 9
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %159
  store i32 %155, ptr %160, align 4
  call void @llvm.nvvm.barrier0()
  %161 = load ptr, ptr %30, align 8
  %162 = load i32, ptr %33, align 4
  %163 = mul nsw i32 12, %162
  %164 = add nsw i32 %163, 10
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds i32, ptr %161, i64 %165
  %167 = load i32, ptr %166, align 4
  %168 = load i32, ptr %34, align 4
  %169 = mul nsw i32 12, %168
  %170 = add nsw i32 %169, 10
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %171
  store i32 %167, ptr %172, align 4
  call void @llvm.nvvm.barrier0()
  %173 = load ptr, ptr %30, align 8
  %174 = load i32, ptr %33, align 4
  %175 = mul nsw i32 12, %174
  %176 = add nsw i32 %175, 11
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds i32, ptr %173, i64 %177
  %179 = load i32, ptr %178, align 4
  %180 = load i32, ptr %34, align 4
  %181 = mul nsw i32 12, %180
  %182 = add nsw i32 %181, 11
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %183
  store i32 %179, ptr %184, align 4
  call void @llvm.nvvm.barrier0()
  %185 = load float, ptr %32, align 4
  %186 = load i32, ptr %34, align 4
  %187 = mul nsw i32 12, %186
  %188 = add nsw i32 %187, 0
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %189
  %191 = load i32, ptr %190, align 4
  %192 = sitofp i32 %191 to float
  %193 = fmul contract float %185, %192
  %194 = fptosi float %193 to i32
  store i32 255, ptr %5, align 4
  store i32 %194, ptr %6, align 4
  %195 = load i32, ptr %5, align 4
  %196 = load i32, ptr %6, align 4
  %197 = icmp sle i32 %195, %196
  %198 = select i1 %197, i32 %195, i32 %196
  %199 = load i32, ptr %34, align 4
  %200 = mul nsw i32 12, %199
  %201 = add nsw i32 %200, 0
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %202
  store i32 %198, ptr %203, align 4
  %204 = load float, ptr %32, align 4
  %205 = load i32, ptr %34, align 4
  %206 = mul nsw i32 12, %205
  %207 = add nsw i32 %206, 1
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %208
  %210 = load i32, ptr %209, align 4
  %211 = sitofp i32 %210 to float
  %212 = fmul contract float %204, %211
  %213 = fptosi float %212 to i32
  store i32 255, ptr %7, align 4
  store i32 %213, ptr %8, align 4
  %214 = load i32, ptr %7, align 4
  %215 = load i32, ptr %8, align 4
  %216 = icmp sle i32 %214, %215
  %217 = select i1 %216, i32 %214, i32 %215
  %218 = load i32, ptr %34, align 4
  %219 = mul nsw i32 12, %218
  %220 = add nsw i32 %219, 1
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %221
  store i32 %217, ptr %222, align 4
  %223 = load float, ptr %32, align 4
  %224 = load i32, ptr %34, align 4
  %225 = mul nsw i32 12, %224
  %226 = add nsw i32 %225, 2
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %227
  %229 = load i32, ptr %228, align 4
  %230 = sitofp i32 %229 to float
  %231 = fmul contract float %223, %230
  %232 = fptosi float %231 to i32
  store i32 255, ptr %9, align 4
  store i32 %232, ptr %10, align 4
  %233 = load i32, ptr %9, align 4
  %234 = load i32, ptr %10, align 4
  %235 = icmp sle i32 %233, %234
  %236 = select i1 %235, i32 %233, i32 %234
  %237 = load i32, ptr %34, align 4
  %238 = mul nsw i32 12, %237
  %239 = add nsw i32 %238, 2
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %240
  store i32 %236, ptr %241, align 4
  %242 = load float, ptr %32, align 4
  %243 = load i32, ptr %34, align 4
  %244 = mul nsw i32 12, %243
  %245 = add nsw i32 %244, 3
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %246
  %248 = load i32, ptr %247, align 4
  %249 = sitofp i32 %248 to float
  %250 = fmul contract float %242, %249
  %251 = fptosi float %250 to i32
  store i32 255, ptr %11, align 4
  store i32 %251, ptr %12, align 4
  %252 = load i32, ptr %11, align 4
  %253 = load i32, ptr %12, align 4
  %254 = icmp sle i32 %252, %253
  %255 = select i1 %254, i32 %252, i32 %253
  %256 = load i32, ptr %34, align 4
  %257 = mul nsw i32 12, %256
  %258 = add nsw i32 %257, 3
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %259
  store i32 %255, ptr %260, align 4
  %261 = load float, ptr %32, align 4
  %262 = load i32, ptr %34, align 4
  %263 = mul nsw i32 12, %262
  %264 = add nsw i32 %263, 4
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %265
  %267 = load i32, ptr %266, align 4
  %268 = sitofp i32 %267 to float
  %269 = fmul contract float %261, %268
  %270 = fptosi float %269 to i32
  store i32 255, ptr %13, align 4
  store i32 %270, ptr %14, align 4
  %271 = load i32, ptr %13, align 4
  %272 = load i32, ptr %14, align 4
  %273 = icmp sle i32 %271, %272
  %274 = select i1 %273, i32 %271, i32 %272
  %275 = load i32, ptr %34, align 4
  %276 = mul nsw i32 12, %275
  %277 = add nsw i32 %276, 4
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %278
  store i32 %274, ptr %279, align 4
  %280 = load float, ptr %32, align 4
  %281 = load i32, ptr %34, align 4
  %282 = mul nsw i32 12, %281
  %283 = add nsw i32 %282, 5
  %284 = sext i32 %283 to i64
  %285 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %284
  %286 = load i32, ptr %285, align 4
  %287 = sitofp i32 %286 to float
  %288 = fmul contract float %280, %287
  %289 = fptosi float %288 to i32
  store i32 255, ptr %15, align 4
  store i32 %289, ptr %16, align 4
  %290 = load i32, ptr %15, align 4
  %291 = load i32, ptr %16, align 4
  %292 = icmp sle i32 %290, %291
  %293 = select i1 %292, i32 %290, i32 %291
  %294 = load i32, ptr %34, align 4
  %295 = mul nsw i32 12, %294
  %296 = add nsw i32 %295, 5
  %297 = sext i32 %296 to i64
  %298 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %297
  store i32 %293, ptr %298, align 4
  %299 = load float, ptr %32, align 4
  %300 = load i32, ptr %34, align 4
  %301 = mul nsw i32 12, %300
  %302 = add nsw i32 %301, 6
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %303
  %305 = load i32, ptr %304, align 4
  %306 = sitofp i32 %305 to float
  %307 = fmul contract float %299, %306
  %308 = fptosi float %307 to i32
  store i32 255, ptr %17, align 4
  store i32 %308, ptr %18, align 4
  %309 = load i32, ptr %17, align 4
  %310 = load i32, ptr %18, align 4
  %311 = icmp sle i32 %309, %310
  %312 = select i1 %311, i32 %309, i32 %310
  %313 = load i32, ptr %34, align 4
  %314 = mul nsw i32 12, %313
  %315 = add nsw i32 %314, 6
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %316
  store i32 %312, ptr %317, align 4
  %318 = load float, ptr %32, align 4
  %319 = load i32, ptr %34, align 4
  %320 = mul nsw i32 12, %319
  %321 = add nsw i32 %320, 7
  %322 = sext i32 %321 to i64
  %323 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %322
  %324 = load i32, ptr %323, align 4
  %325 = sitofp i32 %324 to float
  %326 = fmul contract float %318, %325
  %327 = fptosi float %326 to i32
  store i32 255, ptr %19, align 4
  store i32 %327, ptr %20, align 4
  %328 = load i32, ptr %19, align 4
  %329 = load i32, ptr %20, align 4
  %330 = icmp sle i32 %328, %329
  %331 = select i1 %330, i32 %328, i32 %329
  %332 = load i32, ptr %34, align 4
  %333 = mul nsw i32 12, %332
  %334 = add nsw i32 %333, 7
  %335 = sext i32 %334 to i64
  %336 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %335
  store i32 %331, ptr %336, align 4
  %337 = load float, ptr %32, align 4
  %338 = load i32, ptr %34, align 4
  %339 = mul nsw i32 12, %338
  %340 = add nsw i32 %339, 8
  %341 = sext i32 %340 to i64
  %342 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %341
  %343 = load i32, ptr %342, align 4
  %344 = sitofp i32 %343 to float
  %345 = fmul contract float %337, %344
  %346 = fptosi float %345 to i32
  store i32 255, ptr %21, align 4
  store i32 %346, ptr %22, align 4
  %347 = load i32, ptr %21, align 4
  %348 = load i32, ptr %22, align 4
  %349 = icmp sle i32 %347, %348
  %350 = select i1 %349, i32 %347, i32 %348
  %351 = load i32, ptr %34, align 4
  %352 = mul nsw i32 12, %351
  %353 = add nsw i32 %352, 8
  %354 = sext i32 %353 to i64
  %355 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %354
  store i32 %350, ptr %355, align 4
  %356 = load float, ptr %32, align 4
  %357 = load i32, ptr %34, align 4
  %358 = mul nsw i32 12, %357
  %359 = add nsw i32 %358, 9
  %360 = sext i32 %359 to i64
  %361 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %360
  %362 = load i32, ptr %361, align 4
  %363 = sitofp i32 %362 to float
  %364 = fmul contract float %356, %363
  %365 = fptosi float %364 to i32
  store i32 255, ptr %23, align 4
  store i32 %365, ptr %24, align 4
  %366 = load i32, ptr %23, align 4
  %367 = load i32, ptr %24, align 4
  %368 = icmp sle i32 %366, %367
  %369 = select i1 %368, i32 %366, i32 %367
  %370 = load i32, ptr %34, align 4
  %371 = mul nsw i32 12, %370
  %372 = add nsw i32 %371, 9
  %373 = sext i32 %372 to i64
  %374 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %373
  store i32 %369, ptr %374, align 4
  %375 = load float, ptr %32, align 4
  %376 = load i32, ptr %34, align 4
  %377 = mul nsw i32 12, %376
  %378 = add nsw i32 %377, 10
  %379 = sext i32 %378 to i64
  %380 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %379
  %381 = load i32, ptr %380, align 4
  %382 = sitofp i32 %381 to float
  %383 = fmul contract float %375, %382
  %384 = fptosi float %383 to i32
  store i32 255, ptr %25, align 4
  store i32 %384, ptr %26, align 4
  %385 = load i32, ptr %25, align 4
  %386 = load i32, ptr %26, align 4
  %387 = icmp sle i32 %385, %386
  %388 = select i1 %387, i32 %385, i32 %386
  %389 = load i32, ptr %34, align 4
  %390 = mul nsw i32 12, %389
  %391 = add nsw i32 %390, 10
  %392 = sext i32 %391 to i64
  %393 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %392
  store i32 %388, ptr %393, align 4
  %394 = load float, ptr %32, align 4
  %395 = load i32, ptr %34, align 4
  %396 = mul nsw i32 12, %395
  %397 = add nsw i32 %396, 11
  %398 = sext i32 %397 to i64
  %399 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %398
  %400 = load i32, ptr %399, align 4
  %401 = sitofp i32 %400 to float
  %402 = fmul contract float %394, %401
  %403 = fptosi float %402 to i32
  store i32 255, ptr %27, align 4
  store i32 %403, ptr %28, align 4
  %404 = load i32, ptr %27, align 4
  %405 = load i32, ptr %28, align 4
  %406 = icmp sle i32 %404, %405
  %407 = select i1 %406, i32 %404, i32 %405
  %408 = load i32, ptr %34, align 4
  %409 = mul nsw i32 12, %408
  %410 = add nsw i32 %409, 11
  %411 = sext i32 %410 to i64
  %412 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %411
  store i32 %407, ptr %412, align 4
  call void @llvm.nvvm.barrier0()
  %413 = load i32, ptr %34, align 4
  %414 = mul nsw i32 12, %413
  %415 = add nsw i32 %414, 0
  %416 = sext i32 %415 to i64
  %417 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %416
  %418 = load i32, ptr %417, align 4
  %419 = load ptr, ptr %29, align 8
  %420 = load i32, ptr %33, align 4
  %421 = mul nsw i32 12, %420
  %422 = add nsw i32 %421, 0
  %423 = sext i32 %422 to i64
  %424 = getelementptr inbounds i32, ptr %419, i64 %423
  store i32 %418, ptr %424, align 4
  call void @llvm.nvvm.barrier0()
  %425 = load i32, ptr %34, align 4
  %426 = mul nsw i32 12, %425
  %427 = add nsw i32 %426, 1
  %428 = sext i32 %427 to i64
  %429 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %428
  %430 = load i32, ptr %429, align 4
  %431 = load ptr, ptr %29, align 8
  %432 = load i32, ptr %33, align 4
  %433 = mul nsw i32 12, %432
  %434 = add nsw i32 %433, 1
  %435 = sext i32 %434 to i64
  %436 = getelementptr inbounds i32, ptr %431, i64 %435
  store i32 %430, ptr %436, align 4
  call void @llvm.nvvm.barrier0()
  %437 = load i32, ptr %34, align 4
  %438 = mul nsw i32 12, %437
  %439 = add nsw i32 %438, 2
  %440 = sext i32 %439 to i64
  %441 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %440
  %442 = load i32, ptr %441, align 4
  %443 = load ptr, ptr %29, align 8
  %444 = load i32, ptr %33, align 4
  %445 = mul nsw i32 12, %444
  %446 = add nsw i32 %445, 2
  %447 = sext i32 %446 to i64
  %448 = getelementptr inbounds i32, ptr %443, i64 %447
  store i32 %442, ptr %448, align 4
  call void @llvm.nvvm.barrier0()
  %449 = load i32, ptr %34, align 4
  %450 = mul nsw i32 12, %449
  %451 = add nsw i32 %450, 3
  %452 = sext i32 %451 to i64
  %453 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %452
  %454 = load i32, ptr %453, align 4
  %455 = load ptr, ptr %29, align 8
  %456 = load i32, ptr %33, align 4
  %457 = mul nsw i32 12, %456
  %458 = add nsw i32 %457, 3
  %459 = sext i32 %458 to i64
  %460 = getelementptr inbounds i32, ptr %455, i64 %459
  store i32 %454, ptr %460, align 4
  call void @llvm.nvvm.barrier0()
  %461 = load i32, ptr %34, align 4
  %462 = mul nsw i32 12, %461
  %463 = add nsw i32 %462, 4
  %464 = sext i32 %463 to i64
  %465 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %464
  %466 = load i32, ptr %465, align 4
  %467 = load ptr, ptr %29, align 8
  %468 = load i32, ptr %33, align 4
  %469 = mul nsw i32 12, %468
  %470 = add nsw i32 %469, 4
  %471 = sext i32 %470 to i64
  %472 = getelementptr inbounds i32, ptr %467, i64 %471
  store i32 %466, ptr %472, align 4
  call void @llvm.nvvm.barrier0()
  %473 = load i32, ptr %34, align 4
  %474 = mul nsw i32 12, %473
  %475 = add nsw i32 %474, 5
  %476 = sext i32 %475 to i64
  %477 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %476
  %478 = load i32, ptr %477, align 4
  %479 = load ptr, ptr %29, align 8
  %480 = load i32, ptr %33, align 4
  %481 = mul nsw i32 12, %480
  %482 = add nsw i32 %481, 5
  %483 = sext i32 %482 to i64
  %484 = getelementptr inbounds i32, ptr %479, i64 %483
  store i32 %478, ptr %484, align 4
  call void @llvm.nvvm.barrier0()
  %485 = load i32, ptr %34, align 4
  %486 = mul nsw i32 12, %485
  %487 = add nsw i32 %486, 6
  %488 = sext i32 %487 to i64
  %489 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %488
  %490 = load i32, ptr %489, align 4
  %491 = load ptr, ptr %29, align 8
  %492 = load i32, ptr %33, align 4
  %493 = mul nsw i32 12, %492
  %494 = add nsw i32 %493, 6
  %495 = sext i32 %494 to i64
  %496 = getelementptr inbounds i32, ptr %491, i64 %495
  store i32 %490, ptr %496, align 4
  call void @llvm.nvvm.barrier0()
  %497 = load i32, ptr %34, align 4
  %498 = mul nsw i32 12, %497
  %499 = add nsw i32 %498, 7
  %500 = sext i32 %499 to i64
  %501 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %500
  %502 = load i32, ptr %501, align 4
  %503 = load ptr, ptr %29, align 8
  %504 = load i32, ptr %33, align 4
  %505 = mul nsw i32 12, %504
  %506 = add nsw i32 %505, 7
  %507 = sext i32 %506 to i64
  %508 = getelementptr inbounds i32, ptr %503, i64 %507
  store i32 %502, ptr %508, align 4
  call void @llvm.nvvm.barrier0()
  %509 = load i32, ptr %34, align 4
  %510 = mul nsw i32 12, %509
  %511 = add nsw i32 %510, 8
  %512 = sext i32 %511 to i64
  %513 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %512
  %514 = load i32, ptr %513, align 4
  %515 = load ptr, ptr %29, align 8
  %516 = load i32, ptr %33, align 4
  %517 = mul nsw i32 12, %516
  %518 = add nsw i32 %517, 8
  %519 = sext i32 %518 to i64
  %520 = getelementptr inbounds i32, ptr %515, i64 %519
  store i32 %514, ptr %520, align 4
  call void @llvm.nvvm.barrier0()
  %521 = load i32, ptr %34, align 4
  %522 = mul nsw i32 12, %521
  %523 = add nsw i32 %522, 9
  %524 = sext i32 %523 to i64
  %525 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %524
  %526 = load i32, ptr %525, align 4
  %527 = load ptr, ptr %29, align 8
  %528 = load i32, ptr %33, align 4
  %529 = mul nsw i32 12, %528
  %530 = add nsw i32 %529, 9
  %531 = sext i32 %530 to i64
  %532 = getelementptr inbounds i32, ptr %527, i64 %531
  store i32 %526, ptr %532, align 4
  call void @llvm.nvvm.barrier0()
  %533 = load i32, ptr %34, align 4
  %534 = mul nsw i32 12, %533
  %535 = add nsw i32 %534, 10
  %536 = sext i32 %535 to i64
  %537 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %536
  %538 = load i32, ptr %537, align 4
  %539 = load ptr, ptr %29, align 8
  %540 = load i32, ptr %33, align 4
  %541 = mul nsw i32 12, %540
  %542 = add nsw i32 %541, 10
  %543 = sext i32 %542 to i64
  %544 = getelementptr inbounds i32, ptr %539, i64 %543
  store i32 %538, ptr %544, align 4
  call void @llvm.nvvm.barrier0()
  %545 = load i32, ptr %34, align 4
  %546 = mul nsw i32 12, %545
  %547 = add nsw i32 %546, 11
  %548 = sext i32 %547 to i64
  %549 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ30rgb_increase_brightness_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %548
  %550 = load i32, ptr %549, align 4
  %551 = load ptr, ptr %29, align 8
  %552 = load i32, ptr %33, align 4
  %553 = mul nsw i32 12, %552
  %554 = add nsw i32 %553, 11
  %555 = sext i32 %554 to i64
  %556 = getelementptr inbounds i32, ptr %551, i64 %555
  store i32 %550, ptr %556, align 4
  call void @llvm.nvvm.barrier0()
  ret void
}

; Function Attrs: convergent noinline norecurse nounwind
define dso_local void @_Z40rgb_increase_brightness_coalesced_unrollPiS_if(ptr noundef %0, ptr noundef %1, i32 noundef %2, float noundef %3) #2 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca ptr, align 8
  %30 = alloca ptr, align 8
  %31 = alloca i32, align 4
  %32 = alloca float, align 4
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  store ptr %0, ptr %29, align 8
  store ptr %1, ptr %30, align 8
  store i32 %2, ptr %31, align 4
  store float %3, ptr %32, align 4
  %35 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %36 = mul i32 12, %35
  %37 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %38 = mul i32 %36, %37
  %39 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %40 = add i32 %38, %39
  store i32 %40, ptr %33, align 4
  %41 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  store i32 %41, ptr %34, align 4
  %42 = load ptr, ptr %30, align 8
  %43 = load i32, ptr %33, align 4
  %44 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %45 = mul i32 0, %44
  %46 = add i32 %43, %45
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds i32, ptr %42, i64 %47
  %49 = load i32, ptr %48, align 4
  %50 = load i32, ptr %34, align 4
  %51 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %52 = mul i32 0, %51
  %53 = add i32 %50, %52
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %54
  store i32 %49, ptr %55, align 4
  call void @llvm.nvvm.barrier0()
  %56 = load ptr, ptr %30, align 8
  %57 = load i32, ptr %33, align 4
  %58 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %59 = mul i32 1, %58
  %60 = add i32 %57, %59
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds i32, ptr %56, i64 %61
  %63 = load i32, ptr %62, align 4
  %64 = load i32, ptr %34, align 4
  %65 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %66 = mul i32 1, %65
  %67 = add i32 %64, %66
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %68
  store i32 %63, ptr %69, align 4
  call void @llvm.nvvm.barrier0()
  %70 = load ptr, ptr %30, align 8
  %71 = load i32, ptr %33, align 4
  %72 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %73 = mul i32 2, %72
  %74 = add i32 %71, %73
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds i32, ptr %70, i64 %75
  %77 = load i32, ptr %76, align 4
  %78 = load i32, ptr %34, align 4
  %79 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %80 = mul i32 2, %79
  %81 = add i32 %78, %80
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %82
  store i32 %77, ptr %83, align 4
  call void @llvm.nvvm.barrier0()
  %84 = load ptr, ptr %30, align 8
  %85 = load i32, ptr %33, align 4
  %86 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %87 = mul i32 3, %86
  %88 = add i32 %85, %87
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds i32, ptr %84, i64 %89
  %91 = load i32, ptr %90, align 4
  %92 = load i32, ptr %34, align 4
  %93 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %94 = mul i32 3, %93
  %95 = add i32 %92, %94
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %96
  store i32 %91, ptr %97, align 4
  call void @llvm.nvvm.barrier0()
  %98 = load ptr, ptr %30, align 8
  %99 = load i32, ptr %33, align 4
  %100 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %101 = mul i32 4, %100
  %102 = add i32 %99, %101
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds i32, ptr %98, i64 %103
  %105 = load i32, ptr %104, align 4
  %106 = load i32, ptr %34, align 4
  %107 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %108 = mul i32 4, %107
  %109 = add i32 %106, %108
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %110
  store i32 %105, ptr %111, align 4
  call void @llvm.nvvm.barrier0()
  %112 = load ptr, ptr %30, align 8
  %113 = load i32, ptr %33, align 4
  %114 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %115 = mul i32 5, %114
  %116 = add i32 %113, %115
  %117 = zext i32 %116 to i64
  %118 = getelementptr inbounds i32, ptr %112, i64 %117
  %119 = load i32, ptr %118, align 4
  %120 = load i32, ptr %34, align 4
  %121 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %122 = mul i32 5, %121
  %123 = add i32 %120, %122
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %124
  store i32 %119, ptr %125, align 4
  call void @llvm.nvvm.barrier0()
  %126 = load ptr, ptr %30, align 8
  %127 = load i32, ptr %33, align 4
  %128 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %129 = mul i32 6, %128
  %130 = add i32 %127, %129
  %131 = zext i32 %130 to i64
  %132 = getelementptr inbounds i32, ptr %126, i64 %131
  %133 = load i32, ptr %132, align 4
  %134 = load i32, ptr %34, align 4
  %135 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %136 = mul i32 6, %135
  %137 = add i32 %134, %136
  %138 = zext i32 %137 to i64
  %139 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %138
  store i32 %133, ptr %139, align 4
  call void @llvm.nvvm.barrier0()
  %140 = load ptr, ptr %30, align 8
  %141 = load i32, ptr %33, align 4
  %142 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %143 = mul i32 7, %142
  %144 = add i32 %141, %143
  %145 = zext i32 %144 to i64
  %146 = getelementptr inbounds i32, ptr %140, i64 %145
  %147 = load i32, ptr %146, align 4
  %148 = load i32, ptr %34, align 4
  %149 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %150 = mul i32 7, %149
  %151 = add i32 %148, %150
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %152
  store i32 %147, ptr %153, align 4
  call void @llvm.nvvm.barrier0()
  %154 = load ptr, ptr %30, align 8
  %155 = load i32, ptr %33, align 4
  %156 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %157 = mul i32 8, %156
  %158 = add i32 %155, %157
  %159 = zext i32 %158 to i64
  %160 = getelementptr inbounds i32, ptr %154, i64 %159
  %161 = load i32, ptr %160, align 4
  %162 = load i32, ptr %34, align 4
  %163 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %164 = mul i32 8, %163
  %165 = add i32 %162, %164
  %166 = zext i32 %165 to i64
  %167 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %166
  store i32 %161, ptr %167, align 4
  call void @llvm.nvvm.barrier0()
  %168 = load ptr, ptr %30, align 8
  %169 = load i32, ptr %33, align 4
  %170 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %171 = mul i32 9, %170
  %172 = add i32 %169, %171
  %173 = zext i32 %172 to i64
  %174 = getelementptr inbounds i32, ptr %168, i64 %173
  %175 = load i32, ptr %174, align 4
  %176 = load i32, ptr %34, align 4
  %177 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %178 = mul i32 9, %177
  %179 = add i32 %176, %178
  %180 = zext i32 %179 to i64
  %181 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %180
  store i32 %175, ptr %181, align 4
  call void @llvm.nvvm.barrier0()
  %182 = load ptr, ptr %30, align 8
  %183 = load i32, ptr %33, align 4
  %184 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %185 = mul i32 10, %184
  %186 = add i32 %183, %185
  %187 = zext i32 %186 to i64
  %188 = getelementptr inbounds i32, ptr %182, i64 %187
  %189 = load i32, ptr %188, align 4
  %190 = load i32, ptr %34, align 4
  %191 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %192 = mul i32 10, %191
  %193 = add i32 %190, %192
  %194 = zext i32 %193 to i64
  %195 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %194
  store i32 %189, ptr %195, align 4
  call void @llvm.nvvm.barrier0()
  %196 = load ptr, ptr %30, align 8
  %197 = load i32, ptr %33, align 4
  %198 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %199 = mul i32 11, %198
  %200 = add i32 %197, %199
  %201 = zext i32 %200 to i64
  %202 = getelementptr inbounds i32, ptr %196, i64 %201
  %203 = load i32, ptr %202, align 4
  %204 = load i32, ptr %34, align 4
  %205 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %206 = mul i32 11, %205
  %207 = add i32 %204, %206
  %208 = zext i32 %207 to i64
  %209 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %208
  store i32 %203, ptr %209, align 4
  call void @llvm.nvvm.barrier0()
  %210 = load float, ptr %32, align 4
  %211 = load i32, ptr %34, align 4
  %212 = mul nsw i32 12, %211
  %213 = add nsw i32 %212, 0
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %214
  %216 = load i32, ptr %215, align 4
  %217 = sitofp i32 %216 to float
  %218 = fmul contract float %210, %217
  %219 = fptosi float %218 to i32
  store i32 255, ptr %5, align 4
  store i32 %219, ptr %6, align 4
  %220 = load i32, ptr %5, align 4
  %221 = load i32, ptr %6, align 4
  %222 = icmp sle i32 %220, %221
  %223 = select i1 %222, i32 %220, i32 %221
  %224 = load i32, ptr %34, align 4
  %225 = mul nsw i32 12, %224
  %226 = add nsw i32 %225, 0
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %227
  store i32 %223, ptr %228, align 4
  %229 = load float, ptr %32, align 4
  %230 = load i32, ptr %34, align 4
  %231 = mul nsw i32 12, %230
  %232 = add nsw i32 %231, 1
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %233
  %235 = load i32, ptr %234, align 4
  %236 = sitofp i32 %235 to float
  %237 = fmul contract float %229, %236
  %238 = fptosi float %237 to i32
  store i32 255, ptr %7, align 4
  store i32 %238, ptr %8, align 4
  %239 = load i32, ptr %7, align 4
  %240 = load i32, ptr %8, align 4
  %241 = icmp sle i32 %239, %240
  %242 = select i1 %241, i32 %239, i32 %240
  %243 = load i32, ptr %34, align 4
  %244 = mul nsw i32 12, %243
  %245 = add nsw i32 %244, 1
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %246
  store i32 %242, ptr %247, align 4
  %248 = load float, ptr %32, align 4
  %249 = load i32, ptr %34, align 4
  %250 = mul nsw i32 12, %249
  %251 = add nsw i32 %250, 2
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %252
  %254 = load i32, ptr %253, align 4
  %255 = sitofp i32 %254 to float
  %256 = fmul contract float %248, %255
  %257 = fptosi float %256 to i32
  store i32 255, ptr %9, align 4
  store i32 %257, ptr %10, align 4
  %258 = load i32, ptr %9, align 4
  %259 = load i32, ptr %10, align 4
  %260 = icmp sle i32 %258, %259
  %261 = select i1 %260, i32 %258, i32 %259
  %262 = load i32, ptr %34, align 4
  %263 = mul nsw i32 12, %262
  %264 = add nsw i32 %263, 2
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %265
  store i32 %261, ptr %266, align 4
  %267 = load float, ptr %32, align 4
  %268 = load i32, ptr %34, align 4
  %269 = mul nsw i32 12, %268
  %270 = add nsw i32 %269, 3
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %271
  %273 = load i32, ptr %272, align 4
  %274 = sitofp i32 %273 to float
  %275 = fmul contract float %267, %274
  %276 = fptosi float %275 to i32
  store i32 255, ptr %11, align 4
  store i32 %276, ptr %12, align 4
  %277 = load i32, ptr %11, align 4
  %278 = load i32, ptr %12, align 4
  %279 = icmp sle i32 %277, %278
  %280 = select i1 %279, i32 %277, i32 %278
  %281 = load i32, ptr %34, align 4
  %282 = mul nsw i32 12, %281
  %283 = add nsw i32 %282, 3
  %284 = sext i32 %283 to i64
  %285 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %284
  store i32 %280, ptr %285, align 4
  %286 = load float, ptr %32, align 4
  %287 = load i32, ptr %34, align 4
  %288 = mul nsw i32 12, %287
  %289 = add nsw i32 %288, 4
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %290
  %292 = load i32, ptr %291, align 4
  %293 = sitofp i32 %292 to float
  %294 = fmul contract float %286, %293
  %295 = fptosi float %294 to i32
  store i32 255, ptr %13, align 4
  store i32 %295, ptr %14, align 4
  %296 = load i32, ptr %13, align 4
  %297 = load i32, ptr %14, align 4
  %298 = icmp sle i32 %296, %297
  %299 = select i1 %298, i32 %296, i32 %297
  %300 = load i32, ptr %34, align 4
  %301 = mul nsw i32 12, %300
  %302 = add nsw i32 %301, 4
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %303
  store i32 %299, ptr %304, align 4
  %305 = load float, ptr %32, align 4
  %306 = load i32, ptr %34, align 4
  %307 = mul nsw i32 12, %306
  %308 = add nsw i32 %307, 5
  %309 = sext i32 %308 to i64
  %310 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %309
  %311 = load i32, ptr %310, align 4
  %312 = sitofp i32 %311 to float
  %313 = fmul contract float %305, %312
  %314 = fptosi float %313 to i32
  store i32 255, ptr %15, align 4
  store i32 %314, ptr %16, align 4
  %315 = load i32, ptr %15, align 4
  %316 = load i32, ptr %16, align 4
  %317 = icmp sle i32 %315, %316
  %318 = select i1 %317, i32 %315, i32 %316
  %319 = load i32, ptr %34, align 4
  %320 = mul nsw i32 12, %319
  %321 = add nsw i32 %320, 5
  %322 = sext i32 %321 to i64
  %323 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %322
  store i32 %318, ptr %323, align 4
  %324 = load float, ptr %32, align 4
  %325 = load i32, ptr %34, align 4
  %326 = mul nsw i32 12, %325
  %327 = add nsw i32 %326, 6
  %328 = sext i32 %327 to i64
  %329 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %328
  %330 = load i32, ptr %329, align 4
  %331 = sitofp i32 %330 to float
  %332 = fmul contract float %324, %331
  %333 = fptosi float %332 to i32
  store i32 255, ptr %17, align 4
  store i32 %333, ptr %18, align 4
  %334 = load i32, ptr %17, align 4
  %335 = load i32, ptr %18, align 4
  %336 = icmp sle i32 %334, %335
  %337 = select i1 %336, i32 %334, i32 %335
  %338 = load i32, ptr %34, align 4
  %339 = mul nsw i32 12, %338
  %340 = add nsw i32 %339, 6
  %341 = sext i32 %340 to i64
  %342 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %341
  store i32 %337, ptr %342, align 4
  %343 = load float, ptr %32, align 4
  %344 = load i32, ptr %34, align 4
  %345 = mul nsw i32 12, %344
  %346 = add nsw i32 %345, 7
  %347 = sext i32 %346 to i64
  %348 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %347
  %349 = load i32, ptr %348, align 4
  %350 = sitofp i32 %349 to float
  %351 = fmul contract float %343, %350
  %352 = fptosi float %351 to i32
  store i32 255, ptr %19, align 4
  store i32 %352, ptr %20, align 4
  %353 = load i32, ptr %19, align 4
  %354 = load i32, ptr %20, align 4
  %355 = icmp sle i32 %353, %354
  %356 = select i1 %355, i32 %353, i32 %354
  %357 = load i32, ptr %34, align 4
  %358 = mul nsw i32 12, %357
  %359 = add nsw i32 %358, 7
  %360 = sext i32 %359 to i64
  %361 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %360
  store i32 %356, ptr %361, align 4
  %362 = load float, ptr %32, align 4
  %363 = load i32, ptr %34, align 4
  %364 = mul nsw i32 12, %363
  %365 = add nsw i32 %364, 8
  %366 = sext i32 %365 to i64
  %367 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %366
  %368 = load i32, ptr %367, align 4
  %369 = sitofp i32 %368 to float
  %370 = fmul contract float %362, %369
  %371 = fptosi float %370 to i32
  store i32 255, ptr %21, align 4
  store i32 %371, ptr %22, align 4
  %372 = load i32, ptr %21, align 4
  %373 = load i32, ptr %22, align 4
  %374 = icmp sle i32 %372, %373
  %375 = select i1 %374, i32 %372, i32 %373
  %376 = load i32, ptr %34, align 4
  %377 = mul nsw i32 12, %376
  %378 = add nsw i32 %377, 8
  %379 = sext i32 %378 to i64
  %380 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %379
  store i32 %375, ptr %380, align 4
  %381 = load float, ptr %32, align 4
  %382 = load i32, ptr %34, align 4
  %383 = mul nsw i32 12, %382
  %384 = add nsw i32 %383, 9
  %385 = sext i32 %384 to i64
  %386 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %385
  %387 = load i32, ptr %386, align 4
  %388 = sitofp i32 %387 to float
  %389 = fmul contract float %381, %388
  %390 = fptosi float %389 to i32
  store i32 255, ptr %23, align 4
  store i32 %390, ptr %24, align 4
  %391 = load i32, ptr %23, align 4
  %392 = load i32, ptr %24, align 4
  %393 = icmp sle i32 %391, %392
  %394 = select i1 %393, i32 %391, i32 %392
  %395 = load i32, ptr %34, align 4
  %396 = mul nsw i32 12, %395
  %397 = add nsw i32 %396, 9
  %398 = sext i32 %397 to i64
  %399 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %398
  store i32 %394, ptr %399, align 4
  %400 = load float, ptr %32, align 4
  %401 = load i32, ptr %34, align 4
  %402 = mul nsw i32 12, %401
  %403 = add nsw i32 %402, 10
  %404 = sext i32 %403 to i64
  %405 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %404
  %406 = load i32, ptr %405, align 4
  %407 = sitofp i32 %406 to float
  %408 = fmul contract float %400, %407
  %409 = fptosi float %408 to i32
  store i32 255, ptr %25, align 4
  store i32 %409, ptr %26, align 4
  %410 = load i32, ptr %25, align 4
  %411 = load i32, ptr %26, align 4
  %412 = icmp sle i32 %410, %411
  %413 = select i1 %412, i32 %410, i32 %411
  %414 = load i32, ptr %34, align 4
  %415 = mul nsw i32 12, %414
  %416 = add nsw i32 %415, 10
  %417 = sext i32 %416 to i64
  %418 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %417
  store i32 %413, ptr %418, align 4
  %419 = load float, ptr %32, align 4
  %420 = load i32, ptr %34, align 4
  %421 = mul nsw i32 12, %420
  %422 = add nsw i32 %421, 11
  %423 = sext i32 %422 to i64
  %424 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %423
  %425 = load i32, ptr %424, align 4
  %426 = sitofp i32 %425 to float
  %427 = fmul contract float %419, %426
  %428 = fptosi float %427 to i32
  store i32 255, ptr %27, align 4
  store i32 %428, ptr %28, align 4
  %429 = load i32, ptr %27, align 4
  %430 = load i32, ptr %28, align 4
  %431 = icmp sle i32 %429, %430
  %432 = select i1 %431, i32 %429, i32 %430
  %433 = load i32, ptr %34, align 4
  %434 = mul nsw i32 12, %433
  %435 = add nsw i32 %434, 11
  %436 = sext i32 %435 to i64
  %437 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %436
  store i32 %432, ptr %437, align 4
  call void @llvm.nvvm.barrier0()
  %438 = load i32, ptr %34, align 4
  %439 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %440 = mul i32 0, %439
  %441 = add i32 %438, %440
  %442 = zext i32 %441 to i64
  %443 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %442
  %444 = load i32, ptr %443, align 4
  %445 = load ptr, ptr %29, align 8
  %446 = load i32, ptr %33, align 4
  %447 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %448 = mul i32 0, %447
  %449 = add i32 %446, %448
  %450 = zext i32 %449 to i64
  %451 = getelementptr inbounds i32, ptr %445, i64 %450
  store i32 %444, ptr %451, align 4
  call void @llvm.nvvm.barrier0()
  %452 = load i32, ptr %34, align 4
  %453 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %454 = mul i32 1, %453
  %455 = add i32 %452, %454
  %456 = zext i32 %455 to i64
  %457 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %456
  %458 = load i32, ptr %457, align 4
  %459 = load ptr, ptr %29, align 8
  %460 = load i32, ptr %33, align 4
  %461 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %462 = mul i32 1, %461
  %463 = add i32 %460, %462
  %464 = zext i32 %463 to i64
  %465 = getelementptr inbounds i32, ptr %459, i64 %464
  store i32 %458, ptr %465, align 4
  call void @llvm.nvvm.barrier0()
  %466 = load i32, ptr %34, align 4
  %467 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %468 = mul i32 2, %467
  %469 = add i32 %466, %468
  %470 = zext i32 %469 to i64
  %471 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %470
  %472 = load i32, ptr %471, align 4
  %473 = load ptr, ptr %29, align 8
  %474 = load i32, ptr %33, align 4
  %475 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %476 = mul i32 2, %475
  %477 = add i32 %474, %476
  %478 = zext i32 %477 to i64
  %479 = getelementptr inbounds i32, ptr %473, i64 %478
  store i32 %472, ptr %479, align 4
  call void @llvm.nvvm.barrier0()
  %480 = load i32, ptr %34, align 4
  %481 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %482 = mul i32 3, %481
  %483 = add i32 %480, %482
  %484 = zext i32 %483 to i64
  %485 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %484
  %486 = load i32, ptr %485, align 4
  %487 = load ptr, ptr %29, align 8
  %488 = load i32, ptr %33, align 4
  %489 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %490 = mul i32 3, %489
  %491 = add i32 %488, %490
  %492 = zext i32 %491 to i64
  %493 = getelementptr inbounds i32, ptr %487, i64 %492
  store i32 %486, ptr %493, align 4
  call void @llvm.nvvm.barrier0()
  %494 = load i32, ptr %34, align 4
  %495 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %496 = mul i32 4, %495
  %497 = add i32 %494, %496
  %498 = zext i32 %497 to i64
  %499 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %498
  %500 = load i32, ptr %499, align 4
  %501 = load ptr, ptr %29, align 8
  %502 = load i32, ptr %33, align 4
  %503 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %504 = mul i32 4, %503
  %505 = add i32 %502, %504
  %506 = zext i32 %505 to i64
  %507 = getelementptr inbounds i32, ptr %501, i64 %506
  store i32 %500, ptr %507, align 4
  call void @llvm.nvvm.barrier0()
  %508 = load i32, ptr %34, align 4
  %509 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %510 = mul i32 5, %509
  %511 = add i32 %508, %510
  %512 = zext i32 %511 to i64
  %513 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %512
  %514 = load i32, ptr %513, align 4
  %515 = load ptr, ptr %29, align 8
  %516 = load i32, ptr %33, align 4
  %517 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %518 = mul i32 5, %517
  %519 = add i32 %516, %518
  %520 = zext i32 %519 to i64
  %521 = getelementptr inbounds i32, ptr %515, i64 %520
  store i32 %514, ptr %521, align 4
  call void @llvm.nvvm.barrier0()
  %522 = load i32, ptr %34, align 4
  %523 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %524 = mul i32 6, %523
  %525 = add i32 %522, %524
  %526 = zext i32 %525 to i64
  %527 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %526
  %528 = load i32, ptr %527, align 4
  %529 = load ptr, ptr %29, align 8
  %530 = load i32, ptr %33, align 4
  %531 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %532 = mul i32 6, %531
  %533 = add i32 %530, %532
  %534 = zext i32 %533 to i64
  %535 = getelementptr inbounds i32, ptr %529, i64 %534
  store i32 %528, ptr %535, align 4
  call void @llvm.nvvm.barrier0()
  %536 = load i32, ptr %34, align 4
  %537 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %538 = mul i32 7, %537
  %539 = add i32 %536, %538
  %540 = zext i32 %539 to i64
  %541 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %540
  %542 = load i32, ptr %541, align 4
  %543 = load ptr, ptr %29, align 8
  %544 = load i32, ptr %33, align 4
  %545 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %546 = mul i32 7, %545
  %547 = add i32 %544, %546
  %548 = zext i32 %547 to i64
  %549 = getelementptr inbounds i32, ptr %543, i64 %548
  store i32 %542, ptr %549, align 4
  call void @llvm.nvvm.barrier0()
  %550 = load i32, ptr %34, align 4
  %551 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %552 = mul i32 8, %551
  %553 = add i32 %550, %552
  %554 = zext i32 %553 to i64
  %555 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %554
  %556 = load i32, ptr %555, align 4
  %557 = load ptr, ptr %29, align 8
  %558 = load i32, ptr %33, align 4
  %559 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %560 = mul i32 8, %559
  %561 = add i32 %558, %560
  %562 = zext i32 %561 to i64
  %563 = getelementptr inbounds i32, ptr %557, i64 %562
  store i32 %556, ptr %563, align 4
  call void @llvm.nvvm.barrier0()
  %564 = load i32, ptr %34, align 4
  %565 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %566 = mul i32 9, %565
  %567 = add i32 %564, %566
  %568 = zext i32 %567 to i64
  %569 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %568
  %570 = load i32, ptr %569, align 4
  %571 = load ptr, ptr %29, align 8
  %572 = load i32, ptr %33, align 4
  %573 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %574 = mul i32 9, %573
  %575 = add i32 %572, %574
  %576 = zext i32 %575 to i64
  %577 = getelementptr inbounds i32, ptr %571, i64 %576
  store i32 %570, ptr %577, align 4
  call void @llvm.nvvm.barrier0()
  %578 = load i32, ptr %34, align 4
  %579 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %580 = mul i32 10, %579
  %581 = add i32 %578, %580
  %582 = zext i32 %581 to i64
  %583 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %582
  %584 = load i32, ptr %583, align 4
  %585 = load ptr, ptr %29, align 8
  %586 = load i32, ptr %33, align 4
  %587 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %588 = mul i32 10, %587
  %589 = add i32 %586, %588
  %590 = zext i32 %589 to i64
  %591 = getelementptr inbounds i32, ptr %585, i64 %590
  store i32 %584, ptr %591, align 4
  call void @llvm.nvvm.barrier0()
  %592 = load i32, ptr %34, align 4
  %593 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %594 = mul i32 11, %593
  %595 = add i32 %592, %594
  %596 = zext i32 %595 to i64
  %597 = getelementptr inbounds [6144 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ40rgb_increase_brightness_coalesced_unrollPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %596
  %598 = load i32, ptr %597, align 4
  %599 = load ptr, ptr %29, align 8
  %600 = load i32, ptr %33, align 4
  %601 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %602 = mul i32 11, %601
  %603 = add i32 %600, %602
  %604 = zext i32 %603 to i64
  %605 = getelementptr inbounds i32, ptr %599, i64 %604
  store i32 %598, ptr %605, align 4
  call void @llvm.nvvm.barrier0()
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3

attributes #0 = { convergent mustprogress noinline norecurse nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_75" "target-features"="+ptx77,+sm_75" }
attributes #1 = { convergent nocallback nounwind }
attributes #2 = { convergent noinline norecurse nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_75" "target-features"="+ptx77,+sm_75" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2, !3}
!nvvm.annotations = !{!4, !5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11, !12}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 7]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{ptr @_Z26rgb_copy_array_interleavedPiS_, !"kernel", i32 1}
!5 = !{ptr @_Z24rgb_copy_array_coalescedPiS_, !"kernel", i32 1}
!6 = !{ptr @_Z26rgb_smem_array_interleavedPiS_i, !"kernel", i32 1}
!7 = !{ptr @_Z23rgb_increase_brightnessPiS_if, !"kernel", i32 1}
!8 = !{ptr @_Z33rgb_increase_brightness_coalescedPiS_if, !"kernel", i32 1}
!9 = !{ptr @_Z30rgb_increase_brightness_unrollPiS_if, !"kernel", i32 1}
!10 = !{ptr @_Z40rgb_increase_brightness_coalesced_unrollPiS_if, !"kernel", i32 1}
!11 = !{!"clang version 16.0.6"}
!12 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
