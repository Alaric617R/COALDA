; ModuleID = 'main-cuda-nvptx64-nvidia-cuda-sm_86.bc'
source_filename = "main.cu"
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

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2

attributes #0 = { convergent noinline norecurse nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_86" "target-features"="+ptx77,+sm_86" }
attributes #1 = { convergent nocallback nounwind }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2, !3}
!nvvm.annotations = !{!4}
!llvm.ident = !{!5, !6}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 7]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{ptr @_Z34rgb_increase_brightness_pass_readyPiS_if, !"kernel", i32 1}
!5 = !{!"clang version 16.0.6"}
!6 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
