/* just test fuzz harness MMM_opt vs 128-bit reference over random inputs.
   for correctness verification only. */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#define M      6074165771ULL
#define MBITS  33
#define R_INV  1619320965ULL

uint64_t MMM_opt(uint64_t X, uint64_t Y, uint64_t Mod, int m){
    uint64_t T=0, Y0=Y&1ULL;
    for(int i=0;i<m;i++){
        uint64_t Xi=X&1ULL, eta=(T&1ULL)^(Xi&Y0);
        uint64_t mX=0ULL-Xi, mE=0ULL-eta;
        T=(T+(Y&mX)+(Mod&mE))>>1; X>>=1;
    }
    uint64_t d=T-Mod, mask=0ULL-(d>>63);
    return d+(Mod&mask);
}
static uint64_t ref(uint64_t X,uint64_t Y){
    __uint128_t p=((__uint128_t)X*Y)%M; p=(p*R_INV)%M; return (uint64_t)p;
}
static uint64_t rnd(void){ /* 64-bit random */
    return ((uint64_t)rand()<<48)^((uint64_t)rand()<<32)^((uint64_t)rand()<<16)^rand();
}
int main(void){
    long N=1000000, fails=0;
    /* edge cases first */
    uint64_t edge[]={0,1,2,M-1,M-2,65537,92683,M/2,(M+1)/2};
    int e=sizeof(edge)/sizeof(edge[0]);
    for(int i=0;i<e;i++)for(int j=0;j<e;j++)
        if(MMM_opt(edge[i],edge[j],M,MBITS)!=ref(edge[i],edge[j])) fails++;
    /* random */
    srand(12345);
    for(long k=0;k<N;k++){
        uint64_t X=rnd()%M, Y=rnd()%M;
        if(MMM_opt(X,Y,M,MBITS)!=ref(X,Y)){ fails++;
            if(fails<=3) printf("FAIL X=%lu Y=%lu\n",X,Y); }
    }
    printf("edge cases: %dx%d, random: %ld  ->  failures = %ld\n", e,e,N,fails);
    printf("%s\n", fails==0 ? "OPTIMIZED KERNEL VERIFIED" : "BUG FOUND");
    return 0;
}
