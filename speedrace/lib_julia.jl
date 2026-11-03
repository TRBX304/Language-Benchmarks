using LinearAlgebra
function f(n)
  A=[((i*j)%7+1)/8 for i in 0:n-1, j in 0:n-1]; B=[((i+j)%5+1)/4 for i in 0:n-1, j in 0:n-1]
  t=time_ns(); C=A*B; el=(time_ns()-t)/1e9
  println("julia(BLAS A*B) mat $n result=$(Int(sum(C)*32)) time=$(round(el,digits=3))s")
end
BLAS.set_num_threads(1); f(100); f(1750)
