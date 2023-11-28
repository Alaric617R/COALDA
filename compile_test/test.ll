; ModuleID = 'test.bc'
source_filename = "test.cu"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }

$_ZN4dim3C2Ejjj = comdat any

@.str = private unnamed_addr constant [24 x i8] c"Host data initialized:\0A\00", align 1
@.str.1 = private unnamed_addr constant [13 x i8] c"%d %d %d %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [34 x i8] c"Data after device internal copy:\0A\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"Error on pixel %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"All matched!\0A\00", align 1

; Function Attrs: noinline norecurse sspstrong uwtable
define dso_local void @_Z41__device_stub__rgb_copy_array_interleavedPiS_(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %struct.dim3, align 8
  %6 = alloca %struct.dim3, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca { i64, i32 }, align 8
  %10 = alloca { i64, i32 }, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %11 = alloca ptr, i64 2, align 16
  %12 = getelementptr ptr, ptr %11, i32 0
  store ptr %3, ptr %12, align 8
  %13 = getelementptr ptr, ptr %11, i32 1
  store ptr %4, ptr %13, align 8
  %14 = call i32 @__cudaPopCallConfiguration(ptr %5, ptr %6, ptr %7, ptr %8)
  %15 = load i64, ptr %7, align 8
  %16 = load ptr, ptr %8, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %9, ptr align 8 %5, i64 12, i1 false)
  %17 = getelementptr inbounds { i64, i32 }, ptr %9, i32 0, i32 0
  %18 = load i64, ptr %17, align 8
  %19 = getelementptr inbounds { i64, i32 }, ptr %9, i32 0, i32 1
  %20 = load i32, ptr %19, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %10, ptr align 8 %6, i64 12, i1 false)
  %21 = getelementptr inbounds { i64, i32 }, ptr %10, i32 0, i32 0
  %22 = load i64, ptr %21, align 8
  %23 = getelementptr inbounds { i64, i32 }, ptr %10, i32 0, i32 1
  %24 = load i32, ptr %23, align 8
  %25 = call noundef i32 @cudaLaunchKernel(ptr noundef @_Z41__device_stub__rgb_copy_array_interleavedPiS_, i64 %18, i32 %20, i64 %22, i32 %24, ptr noundef %11, i64 noundef %15, ptr noundef %16)
  br label %26

26:                                               ; preds = %2
  ret void
}

declare i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr)

declare i32 @cudaLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr)

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: mustprogress noinline sspstrong uwtable
define dso_local void @_Z14test_rgb_arrayv() #2 {
  %1 = alloca %struct.dim3, align 4
  %2 = alloca %struct.dim3, align 4
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.dim3, align 4
  %12 = alloca %struct.dim3, align 4
  %13 = alloca { i64, i32 }, align 4
  %14 = alloca { i64, i32 }, align 4
  %15 = alloca i8, align 1
  %16 = alloca i32, align 4
  call void @_ZN4dim3C2Ejjj(ptr noundef nonnull align 4 dereferenceable(12) %1, i32 noundef 1, i32 noundef 1, i32 noundef 1)
  call void @_ZN4dim3C2Ejjj(ptr noundef nonnull align 4 dereferenceable(12) %2, i32 noundef 32, i32 noundef 1, i32 noundef 1)
  store i32 32, ptr %3, align 4
  %17 = load i32, ptr %3, align 4
  %18 = mul nsw i32 3, %17
  %19 = zext i32 %18 to i64
  %20 = call ptr @llvm.stacksave()
  store ptr %20, ptr %4, align 8
  %21 = alloca i32, i64 %19, align 16
  store i64 %19, ptr %5, align 8
  %22 = load i32, ptr %3, align 4
  %23 = mul nsw i32 3, %22
  %24 = zext i32 %23 to i64
  %25 = alloca i32, i64 %24, align 16
  store i64 %24, ptr %6, align 8
  call void @srand(i32 noundef 1) #8
  store i32 0, ptr %9, align 4
  br label %26

26:                                               ; preds = %52, %0
  %27 = load i32, ptr %9, align 4
  %28 = load i32, ptr %3, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %55

30:                                               ; preds = %26
  %31 = call i32 @rand() #8
  %32 = srem i32 %31, 256
  %33 = load i32, ptr %9, align 4
  %34 = mul nsw i32 3, %33
  %35 = add nsw i32 %34, 0
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, ptr %21, i64 %36
  store i32 %32, ptr %37, align 4
  %38 = call i32 @rand() #8
  %39 = srem i32 %38, 256
  %40 = load i32, ptr %9, align 4
  %41 = mul nsw i32 3, %40
  %42 = add nsw i32 %41, 1
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, ptr %21, i64 %43
  store i32 %39, ptr %44, align 4
  %45 = call i32 @rand() #8
  %46 = srem i32 %45, 256
  %47 = load i32, ptr %9, align 4
  %48 = mul nsw i32 3, %47
  %49 = add nsw i32 %48, 2
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, ptr %21, i64 %50
  store i32 %46, ptr %51, align 4
  br label %52

52:                                               ; preds = %30
  %53 = load i32, ptr %9, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, ptr %9, align 4
  br label %26, !llvm.loop !7

55:                                               ; preds = %26
  %56 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 0, ptr %10, align 4
  br label %57

57:                                               ; preds = %82, %55
  %58 = load i32, ptr %10, align 4
  %59 = load i32, ptr %3, align 4
  %60 = icmp slt i32 %58, %59
  br i1 %60, label %61, label %85

61:                                               ; preds = %57
  %62 = load i32, ptr %10, align 4
  %63 = load i32, ptr %10, align 4
  %64 = mul nsw i32 3, %63
  %65 = add nsw i32 %64, 0
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i32, ptr %21, i64 %66
  %68 = load i32, ptr %67, align 4
  %69 = load i32, ptr %10, align 4
  %70 = mul nsw i32 3, %69
  %71 = add nsw i32 %70, 1
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i32, ptr %21, i64 %72
  %74 = load i32, ptr %73, align 4
  %75 = load i32, ptr %10, align 4
  %76 = mul nsw i32 3, %75
  %77 = add nsw i32 %76, 2
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i32, ptr %21, i64 %78
  %80 = load i32, ptr %79, align 4
  %81 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %62, i32 noundef %68, i32 noundef %74, i32 noundef %80)
  br label %82

82:                                               ; preds = %61
  %83 = load i32, ptr %10, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, ptr %10, align 4
  br label %57, !llvm.loop !9

85:                                               ; preds = %57
  %86 = load i32, ptr %3, align 4
  %87 = mul nsw i32 3, %86
  %88 = sext i32 %87 to i64
  %89 = mul i64 %88, 4
  %90 = call noundef i32 @_ZL10cudaMallocIiE9cudaErrorPPT_m(ptr noundef %7, i64 noundef %89)
  %91 = load i32, ptr %3, align 4
  %92 = mul nsw i32 3, %91
  %93 = sext i32 %92 to i64
  %94 = mul i64 %93, 4
  %95 = call noundef i32 @_ZL10cudaMallocIiE9cudaErrorPPT_m(ptr noundef %8, i64 noundef %94)
  %96 = load ptr, ptr %7, align 8
  %97 = load i32, ptr %3, align 4
  %98 = mul nsw i32 3, %97
  %99 = sext i32 %98 to i64
  %100 = mul i64 %99, 4
  %101 = call i32 @cudaMemcpy(ptr noundef %96, ptr noundef %21, i64 noundef %100, i32 noundef 1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %11, ptr align 4 %1, i64 12, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %12, ptr align 4 %2, i64 12, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %13, ptr align 4 %11, i64 12, i1 false)
  %102 = getelementptr inbounds { i64, i32 }, ptr %13, i32 0, i32 0
  %103 = load i64, ptr %102, align 4
  %104 = getelementptr inbounds { i64, i32 }, ptr %13, i32 0, i32 1
  %105 = load i32, ptr %104, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %14, ptr align 4 %12, i64 12, i1 false)
  %106 = getelementptr inbounds { i64, i32 }, ptr %14, i32 0, i32 0
  %107 = load i64, ptr %106, align 4
  %108 = getelementptr inbounds { i64, i32 }, ptr %14, i32 0, i32 1
  %109 = load i32, ptr %108, align 4
  %110 = call i32 @__cudaPushCallConfiguration(i64 %103, i32 %105, i64 %107, i32 %109, i64 noundef 0, ptr noundef null)
  %111 = icmp ne i32 %110, 0
  br i1 %111, label %115, label %112

112:                                              ; preds = %85
  %113 = load ptr, ptr %8, align 8
  %114 = load ptr, ptr %7, align 8
  call void @_Z41__device_stub__rgb_copy_array_interleavedPiS_(ptr noundef %113, ptr noundef %114)
  br label %115

115:                                              ; preds = %112, %85
  %116 = call i32 @cudaDeviceSynchronize()
  %117 = load ptr, ptr %8, align 8
  %118 = load i32, ptr %3, align 4
  %119 = mul nsw i32 3, %118
  %120 = sext i32 %119 to i64
  %121 = mul i64 %120, 4
  %122 = call i32 @cudaMemcpy(ptr noundef %25, ptr noundef %117, i64 noundef %121, i32 noundef 2)
  %123 = call i32 @cudaDeviceSynchronize()
  store i8 1, ptr %15, align 1
  %124 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  store i32 0, ptr %16, align 4
  br label %125

125:                                              ; preds = %195, %115
  %126 = load i32, ptr %16, align 4
  %127 = load i32, ptr %3, align 4
  %128 = icmp slt i32 %126, %127
  br i1 %128, label %129, label %198

129:                                              ; preds = %125
  %130 = load i32, ptr %16, align 4
  %131 = load i32, ptr %16, align 4
  %132 = mul nsw i32 3, %131
  %133 = add nsw i32 %132, 0
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds i32, ptr %25, i64 %134
  %136 = load i32, ptr %135, align 4
  %137 = load i32, ptr %16, align 4
  %138 = mul nsw i32 3, %137
  %139 = add nsw i32 %138, 1
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i32, ptr %25, i64 %140
  %142 = load i32, ptr %141, align 4
  %143 = load i32, ptr %16, align 4
  %144 = mul nsw i32 3, %143
  %145 = add nsw i32 %144, 2
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds i32, ptr %25, i64 %146
  %148 = load i32, ptr %147, align 4
  %149 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %130, i32 noundef %136, i32 noundef %142, i32 noundef %148)
  %150 = load i32, ptr %16, align 4
  %151 = mul nsw i32 3, %150
  %152 = add nsw i32 %151, 0
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds i32, ptr %25, i64 %153
  %155 = load i32, ptr %154, align 4
  %156 = load i32, ptr %16, align 4
  %157 = mul nsw i32 3, %156
  %158 = add nsw i32 %157, 0
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds i32, ptr %21, i64 %159
  %161 = load i32, ptr %160, align 4
  %162 = icmp ne i32 %155, %161
  br i1 %162, label %191, label %163

163:                                              ; preds = %129
  %164 = load i32, ptr %16, align 4
  %165 = mul nsw i32 3, %164
  %166 = add nsw i32 %165, 1
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds i32, ptr %25, i64 %167
  %169 = load i32, ptr %168, align 4
  %170 = load i32, ptr %16, align 4
  %171 = mul nsw i32 3, %170
  %172 = add nsw i32 %171, 1
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds i32, ptr %21, i64 %173
  %175 = load i32, ptr %174, align 4
  %176 = icmp ne i32 %169, %175
  br i1 %176, label %191, label %177

177:                                              ; preds = %163
  %178 = load i32, ptr %16, align 4
  %179 = mul nsw i32 3, %178
  %180 = add nsw i32 %179, 2
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds i32, ptr %25, i64 %181
  %183 = load i32, ptr %182, align 4
  %184 = load i32, ptr %16, align 4
  %185 = mul nsw i32 3, %184
  %186 = add nsw i32 %185, 2
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds i32, ptr %21, i64 %187
  %189 = load i32, ptr %188, align 4
  %190 = icmp ne i32 %183, %189
  br i1 %190, label %191, label %194

191:                                              ; preds = %177, %163, %129
  store i8 0, ptr %15, align 1
  %192 = load i32, ptr %16, align 4
  %193 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %192)
  br label %194

194:                                              ; preds = %191, %177
  br label %195

195:                                              ; preds = %194
  %196 = load i32, ptr %16, align 4
  %197 = add nsw i32 %196, 1
  store i32 %197, ptr %16, align 4
  br label %125, !llvm.loop !10

198:                                              ; preds = %125
  %199 = load i8, ptr %15, align 1
  %200 = trunc i8 %199 to i1
  br i1 %200, label %201, label %203

201:                                              ; preds = %198
  %202 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %203

203:                                              ; preds = %201, %198
  %204 = load ptr, ptr %7, align 8
  %205 = call i32 @cudaFree(ptr noundef %204)
  %206 = load ptr, ptr %8, align 8
  %207 = call i32 @cudaFree(ptr noundef %206)
  %208 = load ptr, ptr %4, align 8
  call void @llvm.stackrestore(ptr %208)
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define linkonce_odr dso_local void @_ZN4dim3C2Ejjj(ptr noundef nonnull align 4 dereferenceable(12) %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) unnamed_addr #3 comdat align 2 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.dim3, ptr %9, i32 0, i32 0
  %11 = load i32, ptr %6, align 4
  store i32 %11, ptr %10, align 4
  %12 = getelementptr inbounds %struct.dim3, ptr %9, i32 0, i32 1
  %13 = load i32, ptr %7, align 4
  store i32 %13, ptr %12, align 4
  %14 = getelementptr inbounds %struct.dim3, ptr %9, i32 0, i32 2
  %15 = load i32, ptr %8, align 4
  store i32 %15, ptr %14, align 4
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave() #4

; Function Attrs: nounwind
declare void @srand(i32 noundef) #5

; Function Attrs: nounwind
declare i32 @rand() #5

declare i32 @printf(ptr noundef, ...) #6

; Function Attrs: mustprogress noinline sspstrong uwtable
define internal noundef i32 @_ZL10cudaMallocIiE9cudaErrorPPT_m(ptr noundef %0, i64 noundef %1) #2 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load i64, ptr %4, align 8
  %7 = call i32 @cudaMalloc(ptr noundef %5, i64 noundef %6)
  ret i32 %7
}

declare i32 @cudaMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) #6

declare i32 @__cudaPushCallConfiguration(i64, i32, i64, i32, i64 noundef, ptr noundef) #6

declare i32 @cudaDeviceSynchronize() #6

declare i32 @cudaFree(ptr noundef) #6

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore(ptr) #4

; Function Attrs: mustprogress noinline norecurse sspstrong uwtable
define dso_local noundef i32 @main() #7 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @_Z14test_rgb_arrayv()
  ret i32 0
}

declare i32 @cudaMalloc(ptr noundef, i64 noundef) #6

attributes #0 = { noinline norecurse sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress noinline sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nosync nounwind willreturn }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress noinline norecurse sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 8]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = !{!"clang version 16.0.6"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
!10 = distinct !{!10, !8}