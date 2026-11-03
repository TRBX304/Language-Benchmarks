public class Bench {
    static long sieve(int n, int reps) {
        long total = 0;
        for (int r = 0; r < reps; r++) {
            boolean[] isComp = new boolean[n + 1];
            int cnt = 0;
            for (int i = 2; i <= n; i++) {
                if (!isComp[i]) {
                    cnt++;
                    for (long j = (long) i * i; j <= n; j += i) isComp[(int) j] = true;
                }
            }
            total += cnt;
        }
        return total;
    }
    static long bit(int n) {
        int[] w = new int[n];
        int sum = 0;
        for (int i = 0; i < n; i++) { w[i] = (i * 7919 + 13) % 1000 + 1; sum += w[i]; }
        int target = sum / 2;
        long cnt = 0;
        for (int mask = 0; mask < (1 << n); mask++) {
            int s = 0;
            for (int i = 0; i < n; i++) if (((mask >> i) & 1) == 1) s += w[i];
            if (s == target) cnt++;
        }
        return cnt;
    }
    static long eq(int n) {
        int k = n * n;
        long cnt = 0;
        for (int x = 0; x <= n; x++)
            for (int y = 0; y <= n; y++)
                for (int z = 0; z <= n; z++)
                    if (x * x + y * y + z * z == k) cnt++;
        return cnt;
    }
    static long mat(int n) {
        double[][] a = new double[n][n], b = new double[n][n], c = new double[n][n];
        for (int i = 0; i < n; i++)
            for (int j = 0; j < n; j++) {
                a[i][j] = ((i * j) % 7 + 1) / 8.0;
                b[i][j] = ((i + j) % 5 + 1) / 4.0;
            }
        for (int i = 0; i < n; i++)
            for (int j = 0; j < n; j++) {
                double s = 0;
                for (int k = 0; k < n; k++) s += a[i][k] * b[k][j];
                c[i][j] = s;
            }
        double total = 0;
        for (int i = 0; i < n; i++) for (int j = 0; j < n; j++) total += c[i][j];
        return (long) (total * 32);
    }
    public static void main(String[] a) {
        String ev = a[0]; int p = Integer.parseInt(a[1]);
        long t = System.nanoTime();
        long r = ev.equals("sieve") ? sieve(10_000_000, p) : ev.equals("bit") ? bit(p) : ev.equals("mat") ? mat(p) : eq(p);
        System.out.printf("java %s %d result=%d time=%.3fs%n", ev, p, r, (System.nanoTime() - t) / 1e9);
    }
}
