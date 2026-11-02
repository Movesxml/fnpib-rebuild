// FUN_002f69c4：原版名称哈希，Jenkins lookup2 混合结构。
// 证据：string_hash_exact_asm.txt（002f69c4–002f6c38）。

public enum OriginalStringHash {
    /// ASCII A-Z 折叠为小写；其他 UTF-8 字节原样参与运算。
    /// 空输入或首字节 NUL 与原函数一样返回 0。
    public static func hash(_ value: String) -> UInt32 {
        hash(utf8: Array(value.utf8))
    }

    private static func hash(utf8 bytes: [UInt8]) -> UInt32 {
        guard let first = bytes.first, first != 0 else { return 0 }

        var lower = bytes
        for index in lower.indices where (0x41...0x5a).contains(lower[index]) {
            lower[index] += 0x20
        }

        var a: UInt32 = 0x9e37_79b9
        var b: UInt32 = 0x9e37_79b9
        var c: UInt32 = 0x0000_0805
        let totalLength = UInt32(truncatingIfNeeded: lower.count)
        var offset = 0

        while lower.count - offset >= 12 {
            a = a &+ word(lower, at: offset)
            b = b &+ word(lower, at: offset + 4)
            c = c &+ word(lower, at: offset + 8)
            mix(&a, &b, &c)
            offset += 12
        }

        // 原版加的是整个输入长度，不是本轮块长或尾部剩余长度。
        c = c &+ totalLength
        let remaining = lower.count - offset
        if remaining > 0 {
            // 跳转表 002f6b6e–002f6b96。byte 3/7/11 用 ldrb；
            // 其余尾部字节用 ldrsb，必须保留高位 UTF-8 的符号扩展。
            switch remaining {
            case 11:
                c = c &+ (UInt32(lower[offset + 10]) << 24)
                fallthrough
            case 10:
                c = c &+ (signed(lower[offset + 9]) << 16)
                fallthrough
            case 9:
                c = c &+ (signed(lower[offset + 8]) << 8)
                fallthrough
            case 8:
                b = b &+ (UInt32(lower[offset + 7]) << 24)
                fallthrough
            case 7:
                b = b &+ (signed(lower[offset + 6]) << 16)
                fallthrough
            case 6:
                b = b &+ (signed(lower[offset + 5]) << 8)
                fallthrough
            case 5:
                b = b &+ signed(lower[offset + 4])
                fallthrough
            case 4:
                a = a &+ (UInt32(lower[offset + 3]) << 24)
                fallthrough
            case 3:
                a = a &+ (signed(lower[offset + 2]) << 16)
                fallthrough
            case 2:
                a = a &+ (signed(lower[offset + 1]) << 8)
                fallthrough
            case 1:
                a = a &+ signed(lower[offset])
            default:
                break
            }
        }

        mix(&a, &b, &c)
        return c
    }

    /// 002f6a3a–002f6aa2 的四条符号／掩码路径合起来仍是小端 UInt32 字。
    private static func word(_ bytes: [UInt8], at offset: Int) -> UInt32 {
        signed(bytes[offset])
            &+ (signed(bytes[offset + 1]) << 8)
            &+ (signed(bytes[offset + 2]) << 16)
            &+ (UInt32(bytes[offset + 3]) << 24)
    }

    private static func signed(_ byte: UInt8) -> UInt32 {
        UInt32(bitPattern: Int32(Int8(bitPattern: byte)))
    }

    /// 002f6aa4–002f6b10 与 002f6bee–002f6c38 共用同一九步混合。
    private static func mix(_ a: inout UInt32, _ b: inout UInt32, _ c: inout UInt32) {
        a = a &- b &- c; a ^= c >> 13
        b = b &- c &- a; b ^= a << 8
        c = c &- a &- b; c ^= b >> 13
        a = a &- b &- c; a ^= c >> 12
        b = b &- c &- a; b ^= a << 16
        c = c &- a &- b; c ^= b >> 5
        a = a &- b &- c; a ^= c >> 3
        b = b &- c &- a; b ^= a << 10
        c = c &- a &- b; c ^= b >> 15
    }
}
