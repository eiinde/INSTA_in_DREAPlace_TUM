# DREAMPlace + INSTA Integration 
This project integrates **INSTA** into **DREAMPlace** to enable timing-aware placement optimization.  
- Only **cell positions** are considered during optimization.  
- Circuit and standard cell library are taken from **ICCAD 2025 Contest - Problem C**.
- All placement optimizations are based on **cell position only**
- No modification to cells or timing models
---

## Setup Instructions

### 1. Clone Repositories and Build Docker

```bash
./build.sh
```

This script will:
- Clone `DREAMPlace_TUM` and `INSTA_TUM`
- Build the Docker image `iccad25c` with all dependencies

### 2. Launch Docker and Build DREAMPlace

```bash
docker run -it --gpus all --name iccadc -v $(pwd):/work iccad25c bash
```

Inside the container:

```bash
./build_constrain.sh
```

This will configure and compile DREAMPlace using `cmake` and `make`.

### 3. Run Placement with INSTA Integration

```bash
./run.sh
```

This script launches the placement flow and collects results.

---

## Results Summary
WNS and TNS

| Version               | TNS max     | WNS max | Total Power (W) |
|-----------------------|-------------|---------|------------------|
| Original              | -100709.26  | -339.64 | 5.49e-02         |
| Original DREAMPlace   | -84387.09   | -346.24 | 5.48e-02         |
| With INSTA (1 pass)   | -84119.44   | -342.28 | 5.48e-02         |
| With INSTA (2 passes) | -81680.57   | -346.30 | 5.48e-02         |

### Power Breakdown Example (With INSTA - 2 Passes)

| Group         | Internal Power | Switching Power | Leakage Power | Total Power | %     |
|---------------|----------------|------------------|----------------|-------------|-------|
| Sequential    | 8.16e-03       | 2.73e-03         | 8.83e-06       | 1.09e-02     | 19.9% |
| Combinational | 1.84e-02       | 2.55e-02         | 1.91e-05       | 4.39e-02     | 80.1% |
| Clock         | 0.00e+00       | 0.00e+00         | 0.00e+00       | 0.00e+00     | 0.0%  |
| Macro         | 0.00e+00       | 0.00e+00         | 0.00e+00       | 0.00e+00     | 0.0%  |
| Pad           | 0.00e+00       | 0.00e+00         | 0.00e+00       | 0.00e+00     | 0.0%  |
| **Total**     | **2.65e-02**   | **2.82e-02**     | **2.79e-05**   | **5.48e-02** | 100%  |

---

