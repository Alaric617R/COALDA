<<<<<<<<<<<<<<<<<<	Modified LLVM IR for Function: _Z34rgb_increase_brightness_pass_readyPiS_if	>>>>>>>>>>>>>>>>>>
<<<<<<<<<<<<<<<<<<	_Z34rgb_increase_brightness_pass_readyPiS_if has been coalesced!	>>>>>>>>>>>>>>>>>>
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
  %BlockIndex = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %BlockDim = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %16 = mul i32 %BlockIndex, %BlockDim
  %LocalTid = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %multDimIndex = mul i32 %BlockDim, %BlockIndex
  %GlobalTID = add i32 %multDimIndex, %LocalTid
  %"multDimIndexScaled#3" = mul i32 %multDimIndex, 3
  %"GlobalTIDScaled#3" = add i32 %"multDimIndexScaled#3", %LocalTid
  %17 = add i32 %16, %LocalTid
  store i32 %17, ptr %14, align 4
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  store i32 %18, ptr %15, align 4
  %19 = load ptr, ptr %11, align 8
  %20 = load i32, ptr %14, align 4
  %21 = mul nsw i32 3, %20
  %22 = add nsw i32 %21, 0
  %23 = sext i32 %22 to i64
  %"offset$0TimesBlockDim" = mul nsw i32 0, %BlockDim
  %valLoadNewOffsetWithOffset1 = add i32 %"GlobalTIDScaled#3", %"offset$0TimesBlockDim"
  %LoadValLoadNewOffsetZext1 = zext i32 %valLoadNewOffsetWithOffset1 to i64
  %24 = getelementptr inbounds i32, ptr %19, i64 %LoadValLoadNewOffsetZext1
  %25 = load i32, ptr %24, align 4
  %26 = load i32, ptr %15, align 4
  %27 = mul nsw i32 3, %26
  %28 = add nsw i32 %27, 0
  %29 = sext i32 %28 to i64
  %"offset$0TimesBlockDimForStore" = mul nsw i32 0, %BlockDim
  %storePtrGEPNewOffset1 = add i32 %"offset$0TimesBlockDimForStore", %LocalTid
  %StorePtrGEPNewOffsetZext1 = zext i32 %storePtrGEPNewOffset1 to i64
  %30 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %StorePtrGEPNewOffsetZext1
  store i32 %25, ptr %30, align 4
  call void @llvm.nvvm.barrier0()
  %31 = load ptr, ptr %11, align 8
  %32 = load i32, ptr %14, align 4
  %33 = mul nsw i32 3, %32
  %34 = add nsw i32 %33, 1
  %35 = sext i32 %34 to i64
  %"offset$1TimesBlockDim" = mul nsw i32 1, %BlockDim
  %valLoadNewOffsetWithOffset2 = add i32 %"GlobalTIDScaled#3", %"offset$1TimesBlockDim"
  %LoadValLoadNewOffsetZext2 = zext i32 %valLoadNewOffsetWithOffset2 to i64
  %36 = getelementptr inbounds i32, ptr %31, i64 %LoadValLoadNewOffsetZext2
  %37 = load i32, ptr %36, align 4
  %38 = load i32, ptr %15, align 4
  %39 = mul nsw i32 3, %38
  %40 = add nsw i32 %39, 1
  %41 = sext i32 %40 to i64
  %"offset$1TimesBlockDimForStore" = mul nsw i32 1, %BlockDim
  %storePtrGEPNewOffset2 = add i32 %"offset$1TimesBlockDimForStore", %LocalTid
  %StorePtrGEPNewOffsetZext2 = zext i32 %storePtrGEPNewOffset2 to i64
  %42 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %StorePtrGEPNewOffsetZext2
  store i32 %37, ptr %42, align 4
  call void @llvm.nvvm.barrier0()
  %43 = load ptr, ptr %11, align 8
  %44 = load i32, ptr %14, align 4
  %45 = mul nsw i32 3, %44
  %46 = add nsw i32 %45, 2
  %47 = sext i32 %46 to i64
  %"offset$2TimesBlockDim" = mul nsw i32 2, %BlockDim
  %valLoadNewOffsetWithOffset3 = add i32 %"GlobalTIDScaled#3", %"offset$2TimesBlockDim"
  %LoadValLoadNewOffsetZext3 = zext i32 %valLoadNewOffsetWithOffset3 to i64
  %48 = getelementptr inbounds i32, ptr %43, i64 %LoadValLoadNewOffsetZext3
  %49 = load i32, ptr %48, align 4
  %50 = load i32, ptr %15, align 4
  %51 = mul nsw i32 3, %50
  %52 = add nsw i32 %51, 2
  %53 = sext i32 %52 to i64
  %"offset$2TimesBlockDimForStore" = mul nsw i32 2, %BlockDim
  %storePtrGEPNewOffset3 = add i32 %"offset$2TimesBlockDimForStore", %LocalTid
  %StorePtrGEPNewOffsetZext3 = zext i32 %storePtrGEPNewOffset3 to i64
  %54 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %StorePtrGEPNewOffsetZext3
  store i32 %49, ptr %54, align 4
  call void @llvm.nvvm.barrier0()
  %55 = load float, ptr %13, align 4
  %56 = load i32, ptr %15, align 4
  %57 = mul nsw i32 3, %56
  %58 = add nsw i32 %57, 0
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %59
  %61 = load i32, ptr %60, align 4
  %62 = sitofp i32 %61 to float
  %63 = fmul contract float %55, %62
  %64 = fptosi float %63 to i32
  store i32 255, ptr %4, align 4
  store i32 %64, ptr %5, align 4
  %65 = load i32, ptr %4, align 4
  %66 = load i32, ptr %5, align 4
  %67 = icmp sle i32 %65, %66
  %68 = select i1 %67, i32 %65, i32 %66
  %69 = load i32, ptr %15, align 4
  %70 = mul nsw i32 3, %69
  %71 = add nsw i32 %70, 0
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %72
  store i32 %68, ptr %73, align 4
  %74 = load float, ptr %13, align 4
  %75 = load i32, ptr %15, align 4
  %76 = mul nsw i32 3, %75
  %77 = add nsw i32 %76, 1
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %78
  %80 = load i32, ptr %79, align 4
  %81 = sitofp i32 %80 to float
  %82 = fmul contract float %74, %81
  %83 = fptosi float %82 to i32
  store i32 255, ptr %6, align 4
  store i32 %83, ptr %7, align 4
  %84 = load i32, ptr %6, align 4
  %85 = load i32, ptr %7, align 4
  %86 = icmp sle i32 %84, %85
  %87 = select i1 %86, i32 %84, i32 %85
  %88 = load i32, ptr %15, align 4
  %89 = mul nsw i32 3, %88
  %90 = add nsw i32 %89, 1
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %91
  store i32 %87, ptr %92, align 4
  %93 = load float, ptr %13, align 4
  %94 = load i32, ptr %15, align 4
  %95 = mul nsw i32 3, %94
  %96 = add nsw i32 %95, 2
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_src to ptr), i64 0, i64 %97
  %99 = load i32, ptr %98, align 4
  %100 = sitofp i32 %99 to float
  %101 = fmul contract float %93, %100
  %102 = fptosi float %101 to i32
  store i32 255, ptr %8, align 4
  store i32 %102, ptr %9, align 4
  %103 = load i32, ptr %8, align 4
  %104 = load i32, ptr %9, align 4
  %105 = icmp sle i32 %103, %104
  %106 = select i1 %105, i32 %103, i32 %104
  %107 = load i32, ptr %15, align 4
  %108 = mul nsw i32 3, %107
  %109 = add nsw i32 %108, 2
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %110
  store i32 %106, ptr %111, align 4
  call void @llvm.nvvm.barrier0()
  %112 = load i32, ptr %15, align 4
  %113 = mul nsw i32 3, %112
  %114 = add nsw i32 %113, 0
  %115 = sext i32 %114 to i64
  %"offset$0TimesBlockDim1" = mul nsw i32 0, %BlockDim
  %valLoadNewOffsetWithOffset12 = add i32 %LocalTid, %"offset$0TimesBlockDim1"
  %LoadValLoadNewOffsetZext13 = zext i32 %valLoadNewOffsetWithOffset12 to i64
  %116 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %LoadValLoadNewOffsetZext13
  %117 = load i32, ptr %116, align 4
  %118 = load ptr, ptr %10, align 8
  %119 = load i32, ptr %14, align 4
  %120 = mul nsw i32 3, %119
  %121 = add nsw i32 %120, 0
  %122 = sext i32 %121 to i64
  %"offset$0TimesBlockDimForStore4" = mul nsw i32 0, %BlockDim
  %storePtrGEPNewOffset15 = add i32 %"offset$0TimesBlockDimForStore4", %"GlobalTIDScaled#3"
  %StorePtrGEPNewOffsetZext16 = zext i32 %storePtrGEPNewOffset15 to i64
  %123 = getelementptr inbounds i32, ptr %118, i64 %StorePtrGEPNewOffsetZext16
  store i32 %117, ptr %123, align 4
  call void @llvm.nvvm.barrier0()
  %124 = load i32, ptr %15, align 4
  %125 = mul nsw i32 3, %124
  %126 = add nsw i32 %125, 1
  %127 = sext i32 %126 to i64
  %"offset$1TimesBlockDim7" = mul nsw i32 1, %BlockDim
  %valLoadNewOffsetWithOffset28 = add i32 %LocalTid, %"offset$1TimesBlockDim7"
  %LoadValLoadNewOffsetZext29 = zext i32 %valLoadNewOffsetWithOffset28 to i64
  %128 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %LoadValLoadNewOffsetZext29
  %129 = load i32, ptr %128, align 4
  %130 = load ptr, ptr %10, align 8
  %131 = load i32, ptr %14, align 4
  %132 = mul nsw i32 3, %131
  %133 = add nsw i32 %132, 1
  %134 = sext i32 %133 to i64
  %"offset$1TimesBlockDimForStore10" = mul nsw i32 1, %BlockDim
  %storePtrGEPNewOffset211 = add i32 %"offset$1TimesBlockDimForStore10", %"GlobalTIDScaled#3"
  %StorePtrGEPNewOffsetZext212 = zext i32 %storePtrGEPNewOffset211 to i64
  %135 = getelementptr inbounds i32, ptr %130, i64 %StorePtrGEPNewOffsetZext212
  store i32 %129, ptr %135, align 4
  call void @llvm.nvvm.barrier0()
  %136 = load i32, ptr %15, align 4
  %137 = mul nsw i32 3, %136
  %138 = add nsw i32 %137, 2
  %139 = sext i32 %138 to i64
  %"offset$2TimesBlockDim13" = mul nsw i32 2, %BlockDim
  %valLoadNewOffsetWithOffset314 = add i32 %LocalTid, %"offset$2TimesBlockDim13"
  %LoadValLoadNewOffsetZext315 = zext i32 %valLoadNewOffsetWithOffset314 to i64
  %140 = getelementptr inbounds [1536 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ34rgb_increase_brightness_pass_readyPiS_ifE14pixel_smem_dst to ptr), i64 0, i64 %LoadValLoadNewOffsetZext315
  %141 = load i32, ptr %140, align 4
  %142 = load ptr, ptr %10, align 8
  %143 = load i32, ptr %14, align 4
  %144 = mul nsw i32 3, %143
  %145 = add nsw i32 %144, 2
  %146 = sext i32 %145 to i64
  %"offset$2TimesBlockDimForStore16" = mul nsw i32 2, %BlockDim
  %storePtrGEPNewOffset317 = add i32 %"offset$2TimesBlockDimForStore16", %"GlobalTIDScaled#3"
  %StorePtrGEPNewOffsetZext318 = zext i32 %storePtrGEPNewOffset317 to i64
  %147 = getelementptr inbounds i32, ptr %142, i64 %StorePtrGEPNewOffsetZext318
  store i32 %141, ptr %147, align 4
  ret void

