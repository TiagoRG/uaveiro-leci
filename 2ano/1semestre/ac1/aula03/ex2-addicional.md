# Alinea b)

| mdor | mdo  | i | res  |                    |
|:----:|:----:|:-:|:----:|:-------------------|
| 0x0B | 0x06 | 0 | 0x00 | Valores iniciais   |
| 0x05 | 0x0C | 1 | 0x06 | Fim da 1ª iteração |
| 0x02 | 0x18 | 2 | 0x12 | Fim da 2ª iteração |
| 0x01 | 0x30 | 3 | 0x12 | Fim da 3ª iteração |
| 0x00 | 0x60 | 4 | 0x42 | Fim da 4ª iteração |

# Alinea c)

Tudo o que é necessário fazer é alterar a condição do `if` para comparar o `i` a 16 em vez de 4 ([linha 34 no código de assembly](https://github.com/TiagoRG/uaveiro-leci/tree/master/2ano/1semestre/ac1/aula03/ex2-addicional.asm))
