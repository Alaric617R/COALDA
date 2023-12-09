; ModuleID = 'rgb_pass_ready_device_1.bc'
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
  %34 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %33
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
  %46 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %45
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
  %58 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %57
  store i32 %53, ptr %58, align 4
  call void @llvm.nvvm.barrier0()
  %59 = load float, ptr %14, align 4
  %60 = load i32, ptr %16, align 4
  %61 = mul nsw i32 3, %60
  %62 = add nsw i32 %61, 0
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %63
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
  %77 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %76
  store i32 %72, ptr %77, align 4
  %78 = load float, ptr %14, align 4
  %79 = load i32, ptr %16, align 4
  %80 = mul nsw i32 3, %79
  %81 = add nsw i32 %80, 1
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %82
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
  %96 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %95
  store i32 %91, ptr %96, align 4
  %97 = load float, ptr %14, align 4
  %98 = load i32, ptr %16, align 4
  %99 = mul nsw i32 3, %98
  %100 = add nsw i32 %99, 2
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %101
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
  %115 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %114
  store i32 %110, ptr %115, align 4
  call void @llvm.nvvm.barrier0()
  %116 = load i32, ptr %16, align 4
  %117 = mul nsw i32 3, %116
  %118 = add nsw i32 %117, 0
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %119
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
  %132 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %131
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
  %144 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %143
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

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #1

; Function Attrs: convergent noinline norecurse nounwind
define dso_local void @_Z44rgb_increase_brightness_pass_ready_coalescedPiS_if(ptr noundef %0, ptr noundef %1, i32 noundef %2, float noundef %3) #0 {
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
  %37 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ44rgb_increase_brightness_pass_ready_coalescedPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %36
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
  %51 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ44rgb_increase_brightness_pass_ready_coalescedPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %50
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
  %65 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ44rgb_increase_brightness_pass_ready_coalescedPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %64
  store i32 %59, ptr %65, align 4
  call void @llvm.nvvm.barrier0()
  %66 = load float, ptr %14, align 4
  %67 = load i32, ptr %16, align 4
  %68 = mul nsw i32 3, %67
  %69 = add nsw i32 %68, 0
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ44rgb_increase_brightness_pass_ready_coalescedPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %70
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
  %84 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ44rgb_increase_brightness_pass_ready_coalescedPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %83
  store i32 %79, ptr %84, align 4
  %85 = load float, ptr %14, align 4
  %86 = load i32, ptr %16, align 4
  %87 = mul nsw i32 3, %86
  %88 = add nsw i32 %87, 1
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ44rgb_increase_brightness_pass_ready_coalescedPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %89
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
  %103 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ44rgb_increase_brightness_pass_ready_coalescedPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %102
  store i32 %98, ptr %103, align 4
  %104 = load float, ptr %14, align 4
  %105 = load i32, ptr %16, align 4
  %106 = mul nsw i32 3, %105
  %107 = add nsw i32 %106, 2
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ44rgb_increase_brightness_pass_ready_coalescedPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %108
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
  %122 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ44rgb_increase_brightness_pass_ready_coalescedPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %121
  store i32 %117, ptr %122, align 4
  call void @llvm.nvvm.barrier0()
  %123 = load i32, ptr %16, align 4
  %124 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %125 = mul i32 0, %124
  %126 = add i32 %123, %125
  %127 = zext i32 %126 to i64
  %128 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ44rgb_increase_brightness_pass_ready_coalescedPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %127
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
  %142 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ44rgb_increase_brightness_pass_ready_coalescedPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %141
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
  %156 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ44rgb_increase_brightness_pass_ready_coalescedPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %155
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
