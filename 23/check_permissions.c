void check_permissions(int perm, int flag, char *message) {
    if (perm & flag)   
        printf("%s\n", message);
}

