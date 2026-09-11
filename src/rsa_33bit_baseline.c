#include <stdio.h>
#include <string.h>

#define MAX_MESSAGE 256
#define CHUNK_BYTES 4
#define MAX_CHUNKS ((MAX_MESSAGE + CHUNK_BYTES - 1) / CHUNK_BYTES)

unsigned long MMM(unsigned long X,
                  unsigned long Y,
                  unsigned long M,
                  unsigned int m)
{
    unsigned int i;
    unsigned long T = 0;
    unsigned long Xi;
    unsigned long T0;
    unsigned long Y0;
    unsigned long eta;
    unsigned long Xi_Y;
    unsigned long eta_M;

    Y0 = Y & 1UL;

    for (i = 0; i < m; i++) {
        Xi = (X >> i) & 1UL;
        T0 = T & 1UL;

        eta = T0 ^ (Xi & Y0);

        Xi_Y = Xi ? Y : 0UL;
        eta_M = eta ? M : 0UL;

        T = (T + Xi_Y + eta_M) >> 1;
    }

    while (T >= M) {
        T -= M;
    }

    return T;
}


unsigned long mod_exp_montgomery(unsigned long base,
                                 unsigned long exponent,
                                 unsigned long M,
                                 unsigned int m,
                                 unsigned long R,
                                 unsigned long R2)
{
    unsigned long base_scaled;
    unsigned long result_scaled;

    base %= M;

    base_scaled = MMM(base, R2, M, m);

    /* Montgomery representation of 1 */
    result_scaled = R;

    while (exponent > 0) {

        if (exponent & 1UL) {
            result_scaled =
                MMM(result_scaled, base_scaled, M, m);
        }

        exponent >>= 1;

        if (exponent > 0) {
            base_scaled =
                MMM(base_scaled, base_scaled, M, m);
        }
    }

    return MMM(result_scaled, 1UL, M, m);
}


/*
 * Pack up to 4 characters into one 32-bit numeric chunk.
 */
unsigned long pack_chunk(const unsigned char *data, int length)
{
    unsigned long value = 0;

    for (int i = 0; i < length; i++) {
        value = (value << 8) | data[i];
    }

    return value;
}


/*
 * Convert one numeric chunk back into characters.
 */
void unpack_chunk(unsigned long value,
                  unsigned char *output,
                  int length)
{
    for (int i = length - 1; i >= 0; i--) {
        output[i] = value & 0xFFUL;
        value >>= 8;
    }
}


int main(void)
{
    const unsigned long p = 80021UL;
    const unsigned long q = 90001UL;

    const unsigned long n = 7201970021UL;

    const unsigned long e = 65537UL;
    const unsigned long d = 5940273473UL;

    const unsigned int m = 33;

    const unsigned long R = 1387964571UL;
    const unsigned long R2 = 1581161194UL;

    char message[MAX_MESSAGE];

    unsigned long plaintext_chunks[MAX_CHUNKS];
    unsigned long encrypted_chunks[MAX_CHUNKS];
    unsigned long decrypted_chunks[MAX_CHUNKS];

    int chunk_lengths[MAX_CHUNKS];

    unsigned char recovered[MAX_MESSAGE];

    int message_length;
    int chunk_count = 0;
    int recovered_index = 0;

    printf("33-bit RSA using Montgomery Multiplication\n");
    printf("-----------------------------------------\n\n");

    printf("Enter a message: ");

    if (fgets(message, sizeof(message), stdin) == NULL) {
        return 1;
    }

    /*
     * Remove newline added by fgets.
     */
    message[strcspn(message, "\n")] = '\0';

    message_length = strlen(message);

    /*
     * Break message into chunks of at most 4 bytes.
     */
    for (int i = 0; i < message_length; i += CHUNK_BYTES) {

        int remaining = message_length - i;

        int length =
            remaining < CHUNK_BYTES
                ? remaining
                : CHUNK_BYTES;

        plaintext_chunks[chunk_count] =
            pack_chunk(
                (unsigned char *)&message[i],
                length
            );

        chunk_lengths[chunk_count] = length;

        chunk_count++;
    }

    printf("\nOriginal message: %s\n", message);
    printf("Number of chunks: %d\n\n", chunk_count);

    /*
     * Encrypt every chunk.
     */
    for (int i = 0; i < chunk_count; i++) {

        encrypted_chunks[i] =
            mod_exp_montgomery(
                plaintext_chunks[i],
                e,
                n,
                m,
                R,
                R2
            );

        printf(
            "Chunk %d: plaintext = %lu, ciphertext = %lu\n",
            i,
            plaintext_chunks[i],
            encrypted_chunks[i]
        );
    }

    /*
     * Decrypt every chunk.
     */
    for (int i = 0; i < chunk_count; i++) {

        decrypted_chunks[i] =
            mod_exp_montgomery(
                encrypted_chunks[i],
                d,
                n,
                m,
                R,
                R2
            );

        unpack_chunk(
            decrypted_chunks[i],
            &recovered[recovered_index],
            chunk_lengths[i]
        );

        recovered_index += chunk_lengths[i];
    }

    recovered[recovered_index] = '\0';

    printf("\nRecovered message: %s\n\n", recovered);

    if (strcmp(message, (char *)recovered) == 0) {
        printf("PASS: decrypted message matches original message\n");
    }
    else {
        printf("FAIL: decrypted message does not match original message\n");
    }

    return 0;
}