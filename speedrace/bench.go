package main

import (
	"fmt"
	"os"
	"strconv"
	"time"
)

func sieve(n, reps int) int {
	total := 0
	for r := 0; r < reps; r++ {
		isComp := make([]bool, n+1)
		cnt := 0
		for i := 2; i <= n; i++ {
			if !isComp[i] {
				cnt++
				for j := i * i; j <= n; j += i {
					isComp[j] = true
				}
			}
		}
		total += cnt
	}
	return total
}

func bit(n int) int {
	w := make([]int, n)
	sum := 0
	for i := 0; i < n; i++ {
		w[i] = (i*7919+13)%1000 + 1
		sum += w[i]
	}
	target := sum / 2
	cnt := 0
	for mask := 0; mask < 1<<n; mask++ {
		s := 0
		for i := 0; i < n; i++ {
			if (mask>>i)&1 == 1 {
				s += w[i]
			}
		}
		if s == target {
			cnt++
		}
	}
	return cnt
}

func eq(n int) int {
	k := n * n
	cnt := 0
	for x := 0; x <= n; x++ {
		for y := 0; y <= n; y++ {
			for z := 0; z <= n; z++ {
				if x*x+y*y+z*z == k {
					cnt++
				}
			}
		}
	}
	return cnt
}

func mat(n int) int {
	a := make([][]float64, n)
	b := make([][]float64, n)
	c := make([][]float64, n)
	for i := 0; i < n; i++ {
		a[i] = make([]float64, n)
		b[i] = make([]float64, n)
		c[i] = make([]float64, n)
		for j := 0; j < n; j++ {
			a[i][j] = float64((i*j)%7+1) / 8
			b[i][j] = float64((i+j)%5+1) / 4
		}
	}
	for i := 0; i < n; i++ {
		for j := 0; j < n; j++ {
			s := 0.0
			for k := 0; k < n; k++ {
				s += a[i][k] * b[k][j]
			}
			c[i][j] = s
		}
	}
	total := 0.0
	for i := 0; i < n; i++ {
		for j := 0; j < n; j++ {
			total += c[i][j]
		}
	}
	return int(total * 32)
}

func main() {
	ev := os.Args[1]
	p, _ := strconv.Atoi(os.Args[2])
	t := time.Now()
	var r int
	switch ev {
	case "sieve":
		r = sieve(10_000_000, p)
	case "bit":
		r = bit(p)
	case "mat":
		r = mat(p)
	default:
		r = eq(p)
	}
	fmt.Printf("go %s %d result=%d time=%.3fs\n", ev, p, r, time.Since(t).Seconds())
}
