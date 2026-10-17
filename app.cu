#include <iostream>
#include <cuda_runtime.h>

// CUDA Kernel function to run on the GPU
__global__ void vectorAdd(const float *A, const float *B, float *C, int N) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < N) {
        C[i] = A[i] + B[i];
    }
}

int main() {
    int N = 50000;
    size_t size = N * sizeof(float);

    // 1. Allocate memory on the Host (CPU)
    float *h_A = (float *)malloc(size);
    float *h_B = (float *)malloc(size);
    float *h_C = (float *)malloc(size);

    // Initialize host vectors
    for (int i = 0; i < N; i++) {
        h_A[i] = 1.0f;
        h_B[i] = 2.0f;
    }

    // 2. Allocate memory on the Device (GPU)
    float *d_A, *d_B, *d_C;
    cudaMalloc(&d_A, size);
    cudaMalloc(&d_B, size);
    cudaMalloc(&d_C, size);

    // 3. Copy data from Host to Device
    cudaMemcpy(d_A, h_A, size, cudaMemcpyHostToDevice);
    cudaMemcpy(d_B, h_B, size, cudaMemcpyHostToDevice);

    // 4. Launch the Kernel on the GPU
    // 256 threads per block, and enough blocks to handle N elements
    int threadsPerBlock = 256;
    int blocksPerGrid = (N + threadsPerBlock - 1) / threadsPerBlock;
    
    vectorAdd<<<blocksPerGrid, threadsPerBlock>>>(d_A, d_B, d_C, N);

    // Wait for GPU to finish before accessing results
    cudaDeviceSynchronize();

    // 5. Copy result back from Device to Host
    cudaMemcpy(h_C, d_C, size, cudaMemcpyDeviceToHost);

    // Verify results (Checking the last element)
    std::cout << "Result verification: " << h_A[N-1] << " + " << h_B[N-1] << " = " << h_C[N-1] << std::endl;
    if (h_C[N-1] == 3.0f) {
        std::cout << "SUCCESS! CUDA is working properly." << std::endl;
    } else {
        std::cout << "FAILURE! Something went wrong." << std::endl;
    }

    // 6. Free memory
    cudaFree(d_A);
    cudaFree(d_B);
    cudaFree(d_C);
    free(h_A);
    free(h_B);
    free(h_C);

    return 0;
}

