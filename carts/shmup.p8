pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
#include main.lua
__gfx__
0000000000249900005555000011110000ee820007000000070000000000000077700000000751000007500000bbbb0000bbb000000000666000000000000000
00000000024997700555555001dd1110077ee8207770000076d0000000110000c7c0000000705110007675000bd33db00bd3db00000000776000000000000000
0070070022499779555333351dddd111e77ee8827770000076d000000671d0001c1000000070751000707500bd7700dbbd700db0000006776500000000000000
000770002244999955333bb3dccddd11eeee8882777000006d500000067cd000010000000770751107707550b377003bb30003b000000660d500000000000000
00077000224449945333bbbbccccdd118ee888229790000076d0000006ccd000000000000777551107775550b300003bbd000db00000060d0d00000000000000
0070070022244442533bb77bc77ccd1128888222999000000000000000dd0000000000007777555177775555bd0000db0bd3db00000006770d00000000000000
0000000002224420053bb770077ccd10022222208980000000000000000000000000000077775551777755550bd33db000bbb000000006700d00000000000000
00000000002222000053bb0000ccd1000022220008000000000000000000000000000000111111110000000000bbbb0000000000000006000d00000000000000
0222000008ee000009940000055500000000000000000000000000000c0000000000000000000000022000000000000000000000000006010d00000000000000
22ddd00028e7e0009794200033355000000000000000000000000000c7c000000000d000000700002882000000000000000000000000760d0d70000000000000
2ddcc000288ee00099442000bb3350000000000000000000000000000c0000000000c000000000000000000000000067760000000007760d0d77000000000000
2dc7c0002288800044422000b7b350000000000000000000000000000000000000dc7cd000000000000000000000005665000000000076060d70000000000000
0dcc000002220000022200000bb30000000000000000000000000000000000000000c00000000000000000000000009999000000000006090d00000000000000
00000000000000000000000000000000000000000000000000000000000000000000d00000000000000000000000094444900000000066090dd0000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000066694122142566007067671ddd7070000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000066912772125600700676776dd7070000000000
0800000000000080000000000000000000000000007d00000070d0000070d0000070d0000007d000000000000006418228125000000000000000000000000000
0000088008800000000000000000000000000000007d00000070d0000070d0000070d0000007d000000000000000412882120000000000000000000000000000
76700005000006760000000000000000000000000077d0000677dd000677dd000677dd000077d000000000000000441221420000000000000000000000000000
7676577577506776011001100110011001100110097dd000069ddd000679dd0006779d000077d900000000000000044444200000000000000000000000000000
6567677577567675188118801881188118811881097dd000069ddd007679ddd007779d000077d900000000000000002222000000000000000000000000000000
5576677577576755111111101111111111111111067dd000067ddd00767dddd0077ddd000076dd00000000000000000000000000000000000000000000000000
7607677577567070076dd7d0176dd7d1076dd7d0007dd000067ddd00767dddd0077ddd000076d000000000000000000000000000000000000000000000000000
7600755765670070076d67d0776d67d6076d676000d6d00000d6d00000d6d00000d6d00000d7d000000000000000000000000000000000000000000000000000
7600077767600070076677d0776677d607667760008888000099990000aaaa0000aaaa0000777700007aa70000a99a0000999900008888000055550000222200
0700077007600070077667600776676007766760089aa98009a77a900aa77aa00aa77aa0077aa77007a99a700a9889a009888890080000800573333002755550
0700007007000070007711000071160000116d0089a77a989a7777a9aa7777aaaa7aa7aa77a99a777a9889a7a980089a9800008980000008573dddd327588885
0700007707000070007771000077160000716d008a7777a897777779a77aa77aa7a99a7a7a9889a7a980089a98000089980000898000000853dbbbbd258eeee8
0000007007000000007711000071160000116d008a7777a897777779a77aa77aa7a99a7a7a9889a7a980089a98000089980000898000000853db77bd258e77e8
0000007777000000007766000077660000776d0089a77a989a7777a9aa7777aaaa7aa7aa77a99a777a9889a7a980089a980000898000000853db77bd258e77e8
0000000770000000000760000007600000076000089aa98009a77a900aa77aa00aa77aa0077aa77007a99a700a9889a0098888900800008003dbbbb0058eeee0
0000000770000000000760000007600000076000008888000099990000aaaa0000aaaa0000777700007aa70000a99a000099990000888800003ddd0000588800
__label__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000088888888000
00000000000000000000000000000000000000000000000000000000000000070000000000000000000000000000000000000000000000000000082222228200
00000000000000000000000000000000000000000000000000000000000000777000000000000000000000000000000000000000000000000000082000008200
00000000000000000000000000000000000000000000000000000000000000777000000000000000000000000000000000000000000000000000082007008200
00000000000000000000000000000000000000000000000000000000000000777000000000000000000000000007000000000000000000000700082077708200
000000000000000000000000000700000000000000000000000000000000009790000000000000000000000000000000000000000000000076d0082077708200
000000000000000000000000000000000000000000000000000000000000009990000000000000000000000000000000000000000000000076d0082077708200
00000000000000000000000000000000000000000000000000000000000000898000000000000000000000000000000000000000000007006d50082097908200
000000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000076d0082099908200
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000082089808200
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000082008008200
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000082000008200
00000000000000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000088888888200
00000000000000000000000000000000000022000000000000000000000000000000000000000000000000000000000000000000000000000000002222222200
00000000000000000000000000000000000288200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000677600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000d0000000000000000000000000566500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000c0000000000000000000000000999900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000dc7cd00000000000000000000009444490000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000c0000000000000000000666694122142556600000000000000000000000000000000000007000000000000000000000000000000000000000000000
000000000d0000000000000000000066691277212556000000000000000000000000000000000000d00000000000000000000000000000000000000000000000
00000000000000000000000000000000691822812500000000000000000000070000000000000000c00000000000000000000000000000000000000000000000
000000000000000000000000000000000912882120000000000000000000007770000000000000dc7cd000000000000000000000000000000000000000000000
00000000000000000000000000000000094122142000000000000000000000777000000000000000c00000000000000000000000000000000000000000000000
00000000000000000000000000000000002444420000000000000000000000777000000000000000d00000000000000000000000000000000000000000000000
000000c0000000000000000000000000000222200000000000000000000000979000000000000000000000000000000000000000000000000000000000000000
00000c7c000000000000000000000000000000000000000000000000000000999000000000000000000000000000000000000000000000000000000000000000
000000c0000000000000000000000000000000000000000000000000000000898000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000c0000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000d0000000000000000000c7c000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000c00000000000000000000c0000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000dc7cd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000c000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000c7c00000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000c000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000070000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000777000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000777000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000777000000000000000000000000000000000070000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000979000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000070000000000000000000000000000000000999000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000898000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000dc7cd000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000070000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000777000000000000000000000000000000000000000000000000d000000000d0000
00000000000000000000000000000000000000000000000000000000000000777000000000000000000000000000000000000000000000000c000000000c0000
0000000000000000000000000000000000000000000d0000000000000000007770000000000000000000000000000000000000000000000dc7cd00000dc7cd00
0000000000000000000000000000000000000000000c000000000000000000979000000000000000000000000000000000000000000000000c000000000c0000
00000000000000000000000000000000000000000dc7cd0000000000000000999000000000000000000000000000000000000000000000000d000000000d0000
0000000000000000000000000000000000000000000c000000000000000000898000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000d000000000000000000080000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000070d000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000070d000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000677dd00000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000679dd00000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000007679ddd0000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000767dddd0000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000767dddd0000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000d6d000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000c7c000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000001c1000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000c0000000000
00000000000000000000000000000000000000000000000000000000000000007000000000000000000000000000000000000000000000000000c7c000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c0000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c00000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c7c0000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c00000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000007000000000000000000000000000000000000000000000000000000700000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000c7c0000000000000000000000000000000000000000000000000000000000000000000000000000c000000000000000000000000000000000000000000
0000000c0000000000000000000000000000000000000000000000000000000000000000000000000000c7c00000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000c000000000000000000000000000000000000000000

__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000190000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000190000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000001900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000190000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000001900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000190000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
