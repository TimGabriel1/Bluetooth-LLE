module Types.Advertising where

import Data.ByteString
import Data.Word
import Prelude

-- | Application protocol data unit
data APDUHeader = APDUHeader
  { -- | 0 to 15 possible values.
    pduType :: PDUType,
    txAdd :: Word8,
    rxAdd :: Word8,
    -- | 0 to 255 possible values.
    length :: Word16
  }

data APDU = APDU
  { header :: APDUHeader,
    payload :: ByteString
  }

data PDUType
  = ADV_IND
  | ADV_DIRECT_IND
  | ADV_NONCONN_IND
  | ADV_SCAN_IND
  | SCAN_REQ
  | SCAN_RSP
  | CONNECT_REQ
  | OTHER

-- | Define Protocol data unit  instancee
instance Enum PDUType where
  fromEnum x = case x of
    ADV_IND -> 0
    ADV_DIRECT_IND -> 1
    ADV_NONCONN_IND -> 2
    ADV_SCAN_IND -> 3
    SCAN_REQ -> 4
    SCAN_RSP -> 5
    CONNECT_REQ -> 6
    OTHER -> 7
  toEnum v = case v of
    0 -> ADV_IND
    1 -> ADV_DIRECT_IND
    2 -> ADV_NONCONN_IND
    3 -> ADV_SCAN_IND
    4 -> SCAN_REQ
    5 -> SCAN_RSP
    6 -> CONNECT_REQ
    _ -> OTHER

-- | Define Discovery Mode as Generic, limited, broadcast and NoDiscovery
data DiscoveryMode
  = Generic
  | Limited
  | Broadcast
  | NoDiscovery

-- | Define Connection Mode
data ConnectabilityMode
  = Directed
  | UnDirected
  | NoConnect

type Channel = Int

type Interval = Int
