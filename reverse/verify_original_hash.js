'use strict';
// Independent JavaScript transcription used only to review ARM tail semantics.
const MASK = 0xffffffff;
function signed(byte) { return (byte << 24) >> 24; }
function mix(a, b, c) {
  a = (a - b - c) >>> 0; a = (a ^ (c >>> 13)) >>> 0;
  b = (b - c - a) >>> 0; b = (b ^ (a << 8)) >>> 0;
  c = (c - a - b) >>> 0; c = (c ^ (b >>> 13)) >>> 0;
  a = (a - b - c) >>> 0; a = (a ^ (c >>> 12)) >>> 0;
  b = (b - c - a) >>> 0; b = (b ^ (a << 16)) >>> 0;
  c = (c - a - b) >>> 0; c = (c ^ (b >>> 5)) >>> 0;
  a = (a - b - c) >>> 0; a = (a ^ (c >>> 3)) >>> 0;
  b = (b - c - a) >>> 0; b = (b ^ (a << 10)) >>> 0;
  c = (c - a - b) >>> 0; c = (c ^ (b >>> 15)) >>> 0;
  return [a, b, c];
}
function hash(text) {
  const input = Array.from(Buffer.from(text, 'utf8'));
  if (!input.length || input[0] === 0) return 0;
  const bytes = input.map(x => x >= 0x41 && x <= 0x5a ? x + 0x20 : x);
  let a = 0x9e3779b9, b = 0x9e3779b9, c = 0x805, offset = 0;
  while (bytes.length - offset >= 12) {
    for (const [target, at] of [['a', 0], ['b', 4], ['c', 8]]) {
      let word = 0;
      for (let i = 0; i < 4; i++) word = (word + ((i === 3 ? bytes[offset+at+i] : signed(bytes[offset+at+i])) * (2 ** (8*i)))) >>> 0;
      if (target === 'a') a = (a + word) >>> 0;
      if (target === 'b') b = (b + word) >>> 0;
      if (target === 'c') c = (c + word) >>> 0;
    }
    [a,b,c] = mix(a,b,c); offset += 12;
  }
  c = (c + bytes.length) >>> 0;
  const left = bytes.length - offset;
  for (let i = 0; i < left; i++) {
    const group = i < 4 ? 'a' : i < 8 ? 'b' : 'c';
    const within = i % 4;
    // lookup2 的 c 尾部从 byte 8 << 8 开始，没有 byte 8 << 0 项。
    const shift = group === 'c' ? within + 1 : within;
    const value = shift === 3 ? bytes[offset+i] : signed(bytes[offset+i]);
    const term = (value * (2 ** (8*shift))) >>> 0;
    if (group === 'a') a = (a + term) >>> 0;
    if (group === 'b') b = (b + term) >>> 0;
    if (group === 'c') c = (c + term) >>> 0;
  }
  return mix(a,b,c)[2];
}
for (const text of ['', 'a', 'ab', 'abc', 'abcd', 'abcde', 'abcdef', 'abcdefg', 'abcdefgh', 'abcdefghi', 'abcdefghij', 'abcdefghijk', 'abcdefghijkl', 'abcdefghijklm', 'apple', 'APPLE', 'Apple', 'FastFruit1', 'bombPairs1', 'LEFT_RIGHT', 'é', 'aé', 'éa', 'ééa', 'aéé', '你好', 'ééééééé']) {
  console.log(JSON.stringify(text), '0x' + hash(text).toString(16).padStart(8, '0'));
}
