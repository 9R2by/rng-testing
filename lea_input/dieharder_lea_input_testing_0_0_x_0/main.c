#include <stdio.h>
#include <stdint.h>

int main(void){
        register uint64_t u = 0;
        FILE *file = fopen("32.example.input", "a");
        if (file == NULL) {
                printf("Unable to open/create the file.\n");
                return 1;
        }
        fprintf(file, "# ==================================================================\n");
        fprintf(file, "# C file generation pow(2,32)  seed = 0\n");
        fprintf(file, "# ==================================================================\n");
        fprintf(file, "type: d\n");
        fprintf(file, "count: 17179869180\n"); //4294967295*4
        fprintf(file, "numbit: 32\n");
        for(u = 0; u <= 0xFFFFFFFF; u++){
                fprintf(file, "0\n0\n%u\n0\n", u);
        }
        fclose(file);
        return 0;
}

