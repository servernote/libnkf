#include "libnkf.h"

int main(void)
{
    const char *a  = "アｧｲアイAB12ＡＢ１２"; /* 半角・全角カナ交じり文字列 */
    /* テスト1 UTF->SJIS変換 半角カナ->全角カナ変換 */
    const char *o1 = "-W -s -X";
    /* テスト2 UTF->SJIS変換 半角カナを全角にしない 全角を半角に 全角カナを半角カナに */
    const char *o2 = "-W -s -x -Z -Z4";
    char *b = NULL;

    printf("%s\n", nkf_guess((unsigned char*)a, strlen(a)));

    b = (char*)nkf_convert((unsigned char*)a, strlen(a), (char*)o1, strlen(o1));

    if(b)
    {
        printf("%s\n", b);
        free(b);
    }

    b = (char*)nkf_convert((unsigned char*)a, strlen(a), (char*)o2, strlen(o2));

    if(b)
    {
        printf("%s\n", b);
        free(b);
    }

    return 0;
}
