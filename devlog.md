开发日志
=================

[TOC]

# CPU调整到riscv64指令集 2019.9.3-

- 调整数据通路宽度到64
- 调整DCache读写宽度
- 调整外围内存, 总线配置
- 引入新指令

## 模块改动说明

### Cache

* Cache64: 64位数据缓存, 使用64位地址
* 目前所有的Cache对外数据宽度均为64

RV64指令集中, 地址非对齐的访存结果是实现相关的, 为了简化设计, 这里对非对齐的访存不做特殊处理

TODO: IMM变化 1 
TODO: 32位乘法器/除法器 1
TODO: RESET VECTOR
TODO: 64 bit AddressSpace 分配
TODO: cache直接使用参数改成64位的效果尚未测试
TODO: 特权寄存器变更
TODO: simple bus 调整和 AXI4 调整 1

## 新指令列表

```
指令|模式|当前进度
---     |BitPat("b1098765_43210_98765_432_10987_6543210")|-
LWU     |BitPat("b???????_?????_?????_110_?????_0000011")|1
LD      |BitPat("b???????_?????_?????_011_?????_0000011")|1
SD      |BitPat("b???????_?????_?????_011_?????_0100011")|1
SLLI    |BitPat("b0000000_?????_?????_001_?????_0010011")|1
SRLI    |BitPat("b0000000_?????_?????_101_?????_0010011")|1
SRAI    |BitPat("b0100000_?????_?????_101_?????_0010011")|1
ADDIW   |BitPat("b???????_?????_?????_000_?????_0011011")|1
SLLIW   |BitPat("b0000000_?????_?????_001_?????_0011011")|1
SRLIW   |BitPat("b0000000_?????_?????_101_?????_0011011")|1
SRAIW   |BitPat("b0100000_?????_?????_101_?????_0011011")|1
ADDW    |BitPat("b0000000_?????_?????_000_?????_0111011")|1
SUBW    |BitPat("b0100000_?????_?????_000_?????_0111011")|1
SLLW    |BitPat("b0000000_?????_?????_001_?????_0111011")|1
SRLW    |BitPat("b0000000_?????_?????_101_?????_0111011")|1
SRAW    |BitPat("b0100000_?????_?????_101_?????_0111011")|1

MULW    |BitPat("b0100000_?????_?????_101_?????_0111011")|1
DIVW    |BitPat("b0100000_?????_?????_101_?????_0111011")|1
DIVUW   |BitPat("b0100000_?????_?????_101_?????_0111011")|1
REMW    |BitPat("b0100000_?????_?????_101_?????_0111011")|1
REMUW   |BitPat("b0100000_?????_?????_101_?????_0111011")|1
```

其他要调整的指令
* LX/SX
* ALUI