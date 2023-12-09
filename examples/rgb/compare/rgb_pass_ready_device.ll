; ModuleID = 'rgb_pass_ready_device.bc'
source_filename = "rgb_pass_ready.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_blockDim_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }

@blockIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@blockDim = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockDim_t, align 1
@threadIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_src = internal addrspace(3) global [1536 x i32] undef, align 4
@_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_dst = internal addrspace(3) global [1536 x i32] undef, align 4
@_ZZ44rgb_increase_brightness_pass_ready_coalescedPiS_ifE14pixel_smem_src = internal addrspace(3) global [1536 x i32] undef, align 4
@_ZZ44rgb_increase_brightness_pass_ready_coalescedPiS_ifE14pixel_smem_dst = internal addrspace(3) global [1536 x i32] undef, align 4

; Function Attrs: convergent noinline norecurse nounwind
define dso_local void @_Z34rgb_increase_brightness_pass_readyPiS_if(ptr noundef %0, ptr noundef %1, i32 noundef %2, float noundef %3) #0 {
BB_0:
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca float, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store ptr %0, ptr %10, align 8
  store ptr %1, ptr %11, align 8
  store i32 %2, ptr %12, align 4
  store float %3, ptr %13, align 4
  %16 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %18 = mul i32 %16, %17
  %19 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %multDimIndex13 = mul i32 %17, %16
  %GlobalTID14 = add i32 %multDimIndex13, %19
  %multDimIndex = mul i32 %17, %16
  %GlobalTID = add i32 %multDimIndex, %19
  %"multDimIndexScaled#3" = mul i32 %multDimIndex, 3
  %"GlobalTIDScaled#3" = add i32 %"multDimIndexScaled#3", %19
  %20 = add i32 %18, %19
  store i32 %20, ptr %14, align 4
  %21 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  store i32 %21, ptr %15, align 4
  %22 = load ptr, ptr %11, align 8
  %23 = load i32, ptr %14, align 4
  %24 = mul nsw i32 3, %23
  %25 = add nsw i32 %24, 0
  %26 = sext i32 %25 to i64
  %valLoadNewOffsetBase1 = add i32 %"GlobalTIDScaled#3", %17
  %valLoadNewOffsetWithOffset1 = add i32 %valLoadNewOffsetBase1, 0
  %27 = getelementptr inbounds i32, ptr %22, i32 %valLoadNewOffsetWithOffset1
  %28 = load i32, ptr %27, align 4
  %29 = load i32, ptr %15, align 4
  %30 = mul nsw i32 3, %29
  %31 = add nsw i32 %30, 0
  %32 = sext i32 %31 to i64
  %storePtrGEPNewOffsetBase1 = add i32 %19, %17
  %storePtrGEPNewOffset1 = add i32 %storePtrGEPNewOffsetBase1, 0
  %33 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_src to ptr), i64 0, i32 %storePtrGEPNewOffset1
  store i32 %28, ptr %33, align 4
  call void @llvm.nvvm.barrier0()
  %34 = load ptr, ptr %11, align 8
  %35 = load i32, ptr %14, align 4
  %36 = mul nsw i32 3, %35
  %37 = add nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %valLoadNewOffsetBase2 = add i32 %"GlobalTIDScaled#3", %17
  %valLoadNewOffsetWithOffset2 = add i32 %valLoadNewOffsetBase2, 1
  %39 = getelementptr inbounds i32, ptr %34, i32 %valLoadNewOffsetWithOffset2
  %40 = load i32, ptr %39, align 4
  %41 = load i32, ptr %15, align 4
  %42 = mul nsw i32 3, %41
  %43 = add nsw i32 %42, 1
  %44 = sext i32 %43 to i64
  %storePtrGEPNewOffsetBase2 = add i32 %19, %17
  %storePtrGEPNewOffset2 = add i32 %storePtrGEPNewOffsetBase2, 1
  %45 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_src to ptr), i64 0, i32 %storePtrGEPNewOffset2
  store i32 %40, ptr %45, align 4
  call void @llvm.nvvm.barrier0()
  %46 = load ptr, ptr %11, align 8
  %47 = load i32, ptr %14, align 4
  %48 = mul nsw i32 3, %47
  %49 = add nsw i32 %48, 2
  %50 = sext i32 %49 to i64
  %valLoadNewOffsetBase3 = add i32 %"GlobalTIDScaled#3", %17
  %valLoadNewOffsetWithOffset3 = add i32 %valLoadNewOffsetBase3, 2
  %51 = getelementptr inbounds i32, ptr %46, i32 %valLoadNewOffsetWithOffset3
  %52 = load i32, ptr %51, align 4
  %53 = load i32, ptr %15, align 4
  %54 = mul nsw i32 3, %53
  %55 = add nsw i32 %54, 2
  %56 = sext i32 %55 to i64
  %storePtrGEPNewOffsetBase3 = add i32 %19, %17
  %storePtrGEPNewOffset3 = add i32 %storePtrGEPNewOffsetBase3, 2
  %57 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_src to ptr), i64 0, i32 %storePtrGEPNewOffset3
  store i32 %52, ptr %57, align 4
  call void @llvm.nvvm.barrier0()
  %58 = load float, ptr %13, align 4
  %59 = load i32, ptr %15, align 4
  %60 = mul nsw i32 3, %59
  %61 = add nsw i32 %60, 0
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %62
  %64 = load i32, ptr %63, align 4
  %65 = sitofp i32 %64 to float
  %66 = fmul contract float %58, %65
  %67 = fptosi float %66 to i32
  store i32 255, ptr %4, align 4
  store i32 %67, ptr %5, align 4
  %68 = load i32, ptr %4, align 4
  %69 = load i32, ptr %5, align 4
  %70 = icmp sle i32 %68, %69
  %71 = select i1 %70, i32 %68, i32 %69
  %72 = load i32, ptr %15, align 4
  %73 = mul nsw i32 3, %72
  %74 = add nsw i32 %73, 0
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %75
  store i32 %71, ptr %76, align 4
  %77 = load float, ptr %13, align 4
  %78 = load i32, ptr %15, align 4
  %79 = mul nsw i32 3, %78
  %80 = add nsw i32 %79, 1
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %81
  %83 = load i32, ptr %82, align 4
  %84 = sitofp i32 %83 to float
  %85 = fmul contract float %77, %84
  %86 = fptosi float %85 to i32
  store i32 255, ptr %6, align 4
  store i32 %86, ptr %7, align 4
  %87 = load i32, ptr %6, align 4
  %88 = load i32, ptr %7, align 4
  %89 = icmp sle i32 %87, %88
  %90 = select i1 %89, i32 %87, i32 %88
  %91 = load i32, ptr %15, align 4
  %92 = mul nsw i32 3, %91
  %93 = add nsw i32 %92, 1
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %94
  store i32 %90, ptr %95, align 4
  %96 = load float, ptr %13, align 4
  %97 = load i32, ptr %15, align 4
  %98 = mul nsw i32 3, %97
  %99 = add nsw i32 %98, 2
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %100
  %102 = load i32, ptr %101, align 4
  %103 = sitofp i32 %102 to float
  %104 = fmul contract float %96, %103
  %105 = fptosi float %104 to i32
  store i32 255, ptr %8, align 4
  store i32 %105, ptr %9, align 4
  %106 = load i32, ptr %8, align 4
  %107 = load i32, ptr %9, align 4
  %108 = icmp sle i32 %106, %107
  %109 = select i1 %108, i32 %106, i32 %107
  %110 = load i32, ptr %15, align 4
  %111 = mul nsw i32 3, %110
  %112 = add nsw i32 %111, 2
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %113
  store i32 %109, ptr %114, align 4
  call void @llvm.nvvm.barrier0()
  %115 = load i32, ptr %15, align 4
  %116 = mul nsw i32 3, %115
  %117 = add nsw i32 %116, 0
  %118 = sext i32 %117 to i64
  %valLoadNewOffsetBase11 = add i32 %19, %17
  %valLoadNewOffsetWithOffset12 = add i32 %valLoadNewOffsetBase11, 0
  %119 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_dst to ptr), i64 0, i32 %valLoadNewOffsetWithOffset12
  %120 = load i32, ptr %119, align 4
  %121 = load ptr, ptr %10, align 8
  %122 = load i32, ptr %14, align 4
  %123 = mul nsw i32 3, %122
  %124 = add nsw i32 %123, 0
  %125 = sext i32 %124 to i64
  %storePtrGEPNewOffsetBase13 = add i32 %"GlobalTIDScaled#3", %17
  %storePtrGEPNewOffset14 = add i32 %storePtrGEPNewOffsetBase13, 0
  %126 = getelementptr inbounds i32, ptr %121, i32 %storePtrGEPNewOffset14
  store i32 %120, ptr %126, align 4
  call void @llvm.nvvm.barrier0()
  %127 = load i32, ptr %15, align 4
  %128 = mul nsw i32 3, %127
  %129 = add nsw i32 %128, 1
  %130 = sext i32 %129 to i64
  %valLoadNewOffsetBase25 = add i32 %19, %17
  %valLoadNewOffsetWithOffset26 = add i32 %valLoadNewOffsetBase25, 1
  %131 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_dst to ptr), i64 0, i32 %valLoadNewOffsetWithOffset26
  %132 = load i32, ptr %131, align 4
  %133 = load ptr, ptr %10, align 8
  %134 = load i32, ptr %14, align 4
  %135 = mul nsw i32 3, %134
  %136 = add nsw i32 %135, 1
  %137 = sext i32 %136 to i64
  %storePtrGEPNewOffsetBase27 = add i32 %"GlobalTIDScaled#3", %17
  %storePtrGEPNewOffset28 = add i32 %storePtrGEPNewOffsetBase27, 1
  %138 = getelementptr inbounds i32, ptr %133, i32 %storePtrGEPNewOffset28
  store i32 %132, ptr %138, align 4
  call void @llvm.nvvm.barrier0()
  %139 = load i32, ptr %15, align 4
  %140 = mul nsw i32 3, %139
  %141 = add nsw i32 %140, 2
  %142 = sext i32 %141 to i64
  %valLoadNewOffsetBase39 = add i32 %19, %17
  %valLoadNewOffsetWithOffset310 = add i32 %valLoadNewOffsetBase39, 2
  %143 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_dst to ptr), i64 0, i32 %valLoadNewOffsetWithOffset310
  %144 = load i32, ptr %143, align 4
  %145 = load ptr, ptr %10, align 8
  %146 = load i32, ptr %14, align 4
  %147 = mul nsw i32 3, %146
  %148 = add nsw i32 %147, 2
  %149 = sext i32 %148 to i64
  %storePtrGEPNewOffsetBase311 = add i32 %"GlobalTIDScaled#3", %17
  %storePtrGEPNewOffset312 = add i32 %storePtrGEPNewOffsetBase311, 2
  %150 = getelementptr inbounds i32, ptr %145, i32 %storePtrGEPNewOffset312
  store i32 %144, ptr %150, align 4
  ret void
}

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #1

; Function Attrs: convergent noinline norecurse nounwind
define dso_local void @_Z44rgb_increase_brightness_pass_ready_coalescedPiS_if(ptr noundef %0, ptr noundef %1, i32 noundef %2, float noundef %3) #0 {
BB_0:
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca float, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store ptr %0, ptr %10, align 8
  store ptr %1, ptr %11, align 8
  store i32 %2, ptr %12, align 4
  store float %3, ptr %13, align 4
  %16 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %17 = mul i32 3, %16
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %19 = mul i32 %17, %18
  %20 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %21 = add i32 %19, %20
  store i32 %21, ptr %14, align 4
  %22 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  store i32 %22, ptr %15, align 4
  %23 = load ptr, ptr %11, align 8
  %24 = load i32, ptr %14, align 4
  %25 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %26 = mul i32 0, %25
  %27 = add i32 %24, %26
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds i32, ptr %23, i64 %28
  %30 = load i32, ptr %29, align 4
  %31 = load i32, ptr %15, align 4
  %32 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %33 = mul i32 0, %32
  %34 = add i32 %31, %33
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ44rgb_increase_brightness_pass_ready_coalescedPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %35
  store i32 %30, ptr %36, align 4
  call void @llvm.nvvm.barrier0()
  %37 = load ptr, ptr %11, align 8
  %38 = load i32, ptr %14, align 4
  %39 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %40 = mul i32 1, %39
  %41 = add i32 %38, %40
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds i32, ptr %37, i64 %42
  %44 = load i32, ptr %43, align 4
  %45 = load i32, ptr %15, align 4
  %46 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %47 = mul i32 1, %46
  %48 = add i32 %45, %47
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ44rgb_increase_brightness_pass_ready_coalescedPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %49
  store i32 %44, ptr %50, align 4
  call void @llvm.nvvm.barrier0()
  %51 = load ptr, ptr %11, align 8
  %52 = load i32, ptr %14, align 4
  %53 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %54 = mul i32 2, %53
  %55 = add i32 %52, %54
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds i32, ptr %51, i64 %56
  %58 = load i32, ptr %57, align 4
  %59 = load i32, ptr %15, align 4
  %60 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %61 = mul i32 2, %60
  %62 = add i32 %59, %61
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ44rgb_increase_brightness_pass_ready_coalescedPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %63
  store i32 %58, ptr %64, align 4
  call void @llvm.nvvm.barrier0()
  %65 = load float, ptr %13, align 4
  %66 = load i32, ptr %15, align 4
  %67 = mul nsw i32 3, %66
  %68 = add nsw i32 %67, 0
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ44rgb_increase_brightness_pass_ready_coalescedPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %69
  %71 = load i32, ptr %70, align 4
  %72 = sitofp i32 %71 to float
  %73 = fmul contract float %65, %72
  %74 = fptosi float %73 to i32
  store i32 255, ptr %4, align 4
  store i32 %74, ptr %5, align 4
  %75 = load i32, ptr %4, align 4
  %76 = load i32, ptr %5, align 4
  %77 = icmp sle i32 %75, %76
  %78 = select i1 %77, i32 %75, i32 %76
  %79 = load i32, ptr %15, align 4
  %80 = mul nsw i32 3, %79
  %81 = add nsw i32 %80, 0
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ44rgb_increase_brightness_pass_ready_coalescedPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %82
  store i32 %78, ptr %83, align 4
  %84 = load float, ptr %13, align 4
  %85 = load i32, ptr %15, align 4
  %86 = mul nsw i32 3, %85
  %87 = add nsw i32 %86, 1
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ44rgb_increase_brightness_pass_ready_coalescedPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %88
  %90 = load i32, ptr %89, align 4
  %91 = sitofp i32 %90 to float
  %92 = fmul contract float %84, %91
  %93 = fptosi float %92 to i32
  store i32 255, ptr %6, align 4
  store i32 %93, ptr %7, align 4
  %94 = load i32, ptr %6, align 4
  %95 = load i32, ptr %7, align 4
  %96 = icmp sle i32 %94, %95
  %97 = select i1 %96, i32 %94, i32 %95
  %98 = load i32, ptr %15, align 4
  %99 = mul nsw i32 3, %98
  %100 = add nsw i32 %99, 1
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ44rgb_increase_brightness_pass_ready_coalescedPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %101
  store i32 %97, ptr %102, align 4
  %103 = load float, ptr %13, align 4
  %104 = load i32, ptr %15, align 4
  %105 = mul nsw i32 3, %104
  %106 = add nsw i32 %105, 2
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ44rgb_increase_brightness_pass_ready_coalescedPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %107
  %109 = load i32, ptr %108, align 4
  %110 = sitofp i32 %109 to float
  %111 = fmul contract float %103, %110
  %112 = fptosi float %111 to i32
  store i32 255, ptr %8, align 4
  store i32 %112, ptr %9, align 4
  %113 = load i32, ptr %8, align 4
  %114 = load i32, ptr %9, align 4
  %115 = icmp sle i32 %113, %114
  %116 = select i1 %115, i32 %113, i32 %114
  %117 = load i32, ptr %15, align 4
  %118 = mul nsw i32 3, %117
  %119 = add nsw i32 %118, 2
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ44rgb_increase_brightness_pass_ready_coalescedPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %120
  store i32 %116, ptr %121, align 4
  call void @llvm.nvvm.barrier0()
  %122 = load i32, ptr %15, align 4
  %123 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %124 = mul i32 0, %123
  %125 = add i32 %122, %124
  %126 = zext i32 %125 to i64
  %127 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ44rgb_increase_brightness_pass_ready_coalescedPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %126
  %128 = load i32, ptr %127, align 4
  %129 = load ptr, ptr %10, align 8
  %130 = load i32, ptr %14, align 4
  %131 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %132 = mul i32 0, %131
  %133 = add i32 %130, %132
  %134 = zext i32 %133 to i64
  %135 = getelementptr inbounds i32, ptr %129, i64 %134
  store i32 %128, ptr %135, align 4
  call void @llvm.nvvm.barrier0()
  %136 = load i32, ptr %15, align 4
  %137 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %138 = mul i32 1, %137
  %139 = add i32 %136, %138
  %140 = zext i32 %139 to i64
  %141 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ44rgb_increase_brightness_pass_ready_coalescedPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %140
  %142 = load i32, ptr %141, align 4
  %143 = load ptr, ptr %10, align 8
  %144 = load i32, ptr %14, align 4
  %145 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %146 = mul i32 1, %145
  %147 = add i32 %144, %146
  %148 = zext i32 %147 to i64
  %149 = getelementptr inbounds i32, ptr %143, i64 %148
  store i32 %142, ptr %149, align 4
  call void @llvm.nvvm.barrier0()
  %150 = load i32, ptr %15, align 4
  %151 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %152 = mul i32 2, %151
  %153 = add i32 %150, %152
  %154 = zext i32 %153 to i64
  %155 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ44rgb_increase_brightness_pass_ready_coalescedPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %154
  %156 = load i32, ptr %155, align 4
  %157 = load ptr, ptr %10, align 8
  %158 = load i32, ptr %14, align 4
  %159 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %160 = mul i32 2, %159
  %161 = add i32 %158, %160
  %162 = zext i32 %161 to i64
  %163 = getelementptr inbounds i32, ptr %157, i64 %162
  store i32 %156, ptr %163, align 4
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2

attributes #0 = { convergent noinline norecurse nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_75" "target-features"="+ptx77,+sm_75" }
attributes #1 = { convergent nocallback nounwind }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2, !3}
!nvvm.annotations = !{!4, !5}
!llvm.ident = !{!6, !7}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 7]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{ptr @_Z34rgb_increase_brightness_pass_readyPiS_if, !"kernel", i32 1}
!5 = !{ptr @_Z44rgb_increase_brightness_pass_ready_coalescedPiS_if, !"kernel", i32 1}
!6 = !{!"clang version 16.0.6"}
!7 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
