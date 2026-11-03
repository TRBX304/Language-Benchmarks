#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

static long long sieve(int n, int reps) {
    long long total = 0;
    for (int r = 0; r < reps; r++) {
        unsigned char *isComp = calloc(n + 1, 1);
        int cnt = 0;
        for (int i = 2; i <= n; i++) {
            if (!isComp[i]) {
                cnt++;
                for (long long j = (long long)i * i; j <= n; j += i) isComp[j] = 1;
            }
        }
        free(isComp);
        total += cnt;
    }
    return total;
}

static long long bit(int n) {
    int w[64], sum = 0;
    for (int i = 0; i < n; i++) { w[i] = (i * 7919 + 13) % 1000 + 1; sum += w[i]; }
    int target = sum / 2;
    long long cnt = 0;
    for (int mask = 0; mask < (1 << n); mask++) {
        int s = 0;
        for (int i = 0; i < n; i++) if ((mask >> i) & 1) s += w[i];
        if (s == target) cnt++;
    }
    return cnt;
}

static long long eq(int n) {
    int k = n * n;
    long long cnt = 0;
    for (int x = 0; x <= n; x++)
        for (int y = 0; y <= n; y++)
            for (int z = 0; z <= n; z++)
                if (x * x + y * y + z * z == k) cnt++;
    return cnt;
}

static long long mat(int n) {
    double *a = malloc(sizeof(double) * n * n), *b = malloc(sizeof(double) * n * n), *c = malloc(sizeof(double) * n * n);
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++) {
            a[i * n + j] = ((i * j) % 7 + 1) / 8.0;
            b[i * n + j] = ((i + j) % 5 + 1) / 4.0;
        }
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++) {
            double s = 0;
            for (int k = 0; k < n; k++) s += a[i * n + k] * b[k * n + j];
            c[i * n + j] = s;
        }
    double total = 0;
    for (int i = 0; i < n * n; i++) total += c[i];
    free(a); free(b); free(c);
    return (long long)(total * 32);
}

int main(int argc, char **argv) {
    const char *ev = argv[1]; int p = atoi(argv[2]);
    struct timespec a, b;
    clock_gettime(CLOCK_MONOTONIC, &a);
    long long r = !strcmp(ev, "sieve") ? sieve(10000000, p) : !strcmp(ev, "bit") ? bit(p) : !strcmp(ev, "mat") ? mat(p) : eq(p);
    clock_gettime(CLOCK_MONOTONIC, &b);
    printf("c %s %d result=%lld time=%.3fs\n", ev, p, r, (b.tv_sec - a.tv_sec) + (b.tv_nsec - a.tv_nsec) / 1e9);
}
