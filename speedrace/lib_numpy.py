import time, numpy as np
n=1750
i=np.arange(n).reshape(-1,1); j=np.arange(n).reshape(1,-1)
a=((i*j)%7+1)/8.0; b=((i+j)%5+1)/4.0
t=time.perf_counter(); c=a@b; el=time.perf_counter()-t
print(f"numpy(BLAS) mat {n} result={int(c.sum()*32)} time={el:.3f}s")
