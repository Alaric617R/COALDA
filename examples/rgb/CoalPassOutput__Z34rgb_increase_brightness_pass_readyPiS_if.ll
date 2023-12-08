<<<<<<<<<<<<<<<<<<	Modified LLVM IR for Function: _Z34rgb_increase_brightness_pass_readyPiS_if	>>>>>>>>>>>>>>>>>>
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

