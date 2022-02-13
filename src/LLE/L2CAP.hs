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

-- | match result configuration codes
toConfigurationResultCodeIdentifier :: Int -> ConfigurationResultCode 
toConfigurationResultCodeIdentifier val 
  | val == 0x0000 = L2CAP_CONF_RESULT_SUCCESS
  | val == 0x0001 = L2CAP_CONF_RESULT_UNACCEPTABLE_PARAMETERS 
  | val == 0x0002 = L2CAP_CONF_RESULT_REJECT 
  | val == 0x0003 = L2CAP_CONF_RESULT_UNKNOWN_OPTIONS   
  | val == 0x0004 = L2CAP_CONF_RESULT_PENDING          
  | val == 0x0005 = L2CAP_CONF_RESULT_FLOW_SPEC_REJECTED 

-- -- | offsets for Signalling
-- toSignalOffsetIdentifier :: Int -> SignallingOffsets
-- toSignalOffsetIdentifier val 
--   | val == 0 = L2CAP_SIGNALING_COMMAND_CODE_OFFSET 
--   | val == 1 = L2CAP_SIGNALING_COMMAND_SIGID_OFFSET 
--   | val == 2 = L2CAP_SIGNALING_COMMAND_LENGTH_OFFSET 
--   | val == 4 = L2CAP_SIGNALING_COMMAND_DATA_OFFSET 
