sudo /opt/cuda-11.7/nsight_compute/ncu --kernel-name rgb_increase_brightness --launch-skip 0 --launch-count 1 -o uncoalesced_chart -f --section MemoryWorkloadAnalysis_Chart "./a.out"
sudo /opt/cuda-11.7/nsight_compute/ncu --kernel-name rgb_increase_brightness_coalesced --launch-skip 0 --launch-count 1 -o coalesced_chart -f --section MemoryWorkloadAnalysis_Chart "./a.out"
sudo /opt/cuda-11.7/nsight_compute/ncu --kernel-name rgb_increase_brightness_unroll --launch-skip 0 --launch-count 1 -o uncoalesced_chart_unroll -f --section MemoryWorkloadAnalysis_Chart "./a.out"
sudo /opt/cuda-11.7/nsight_compute/ncu --kernel-name rgb_increase_brightness_coalesced_unroll --launch-skip 0 --launch-count 1 -o coalesced_chart_unroll -f --section MemoryWorkloadAnalysis_Chart "./a.out"
