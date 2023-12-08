<<<<<<<<<<<<<<<<<<	Modified LLVM IR for Function: _Z44rgb_increase_brightness_pass_ready_coalescedPiS_if	>>>>>>>>>>>>>>>>>>
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

