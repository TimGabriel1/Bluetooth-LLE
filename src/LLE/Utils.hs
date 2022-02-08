module LLE.Utils where

import Data.Bits
import Data.Word

setIf :: Bits a => Word8 -> a -> Int -> a
setIf 1 w16 pos = setBit w16 pos
setIf _ w16 _ = w16
