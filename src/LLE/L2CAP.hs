module LLE.L2CAP where

import Types.L2CAP

-- | Convert the  value to corresponding channel identifier.
toChannelIdentifier :: Int -> ChannelIdentifier
toChannelIdentifier val
  | val == 0x0000 = Null
  | val == 0x0001 = Signalling
  | val == 0x0002 = ConnectionLessReception
  | val < 0x003f = Reserved
  | val < 0xffff = Dynamic
  | otherwise = error "unknown channel identifier"

-- | Returns the local and remote Channel identifier for the given channel type
findCID :: ChannelType -> (ChannelIdentifier, ChannelIdentifier)
findCID Connection = (Dynamic, Dynamic)
findCID ConnectionLess = (Dynamic, toChannelIdentifier 0x0002)
findCID Signal = (toChannelIdentifier 0x0001, toChannelIdentifier 0x0001)
