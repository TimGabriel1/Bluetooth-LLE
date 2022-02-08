module LLE.Data where

import Data.Bits
import Data.Word
import LLE.Utils
import Types.Data

-- Data header can be either 16 or 24 bits, but to support both we are using 32 bits.
-- and we use the bool to delete the extra bits from it.
toBitForm :: DataHeader -> (Bool, Word32)
toBitForm dh =
  case cteInfo dh of
    Just cteInfo' -> (True, withCteInfo cteInfo')
    Nothing -> (False, withoutCteInfo)
  where
    withoutCteInfo =
      let z = zeroBits
          llidV = shiftL (llid dh) 14
          singles =
            setIf
              (nsen dh)
              ( setIf
                  (sn dh)
                  ( setIf
                      (md dh)
                      (setIf (cp dh) z 10)
                      11
                  )
                  12
              )
              13
          rfuV = shiftL (rfu dh) 8
       in llidV .|. singles .|. rfuV .|. (Types.Data.length dh)

    withCteInfo cteInfo' =
      let z = zeroBits
          llidV = shiftL (llid dh) 22
          singles =
            setIf
              (nsen dh)
              ( setIf
                  (sn dh)
                  ( setIf
                      (md dh)
                      (setIf (cp dh) z 18)
                      19
                  )
                  20
              )
              21
          rfuV = shiftL (rfu dh) 16
       in llidV .|. singles .|. rfuV .|. (shiftL (Types.Data.length dh) 8) .|. cteInfo'
