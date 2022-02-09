{-# LANGUAGE DuplicateRecordFields #-}

module Types.L2CAP where

import Data.Int

data ChannelIdentifier
  = Null
  | Signalling
  | ConnectionLessReception
  | Reserved
  | Dynamic

data ChannelType
  = Connection
  | ConnectionLess
  | Signal

data SignallingCommand
  = RESERVED
  | COMMANDREJECT
  | CONNECTIONREQ
  | CONNECTIONRESP
  | CONFIGUREREQ
  | CONFIGURERESP
  | DISCONNECTREQ
  | DISCONNECTRESP
  | ECHOREQ
  | ECHORESP
  | INFORMATIONREQ
  | INFORMATIONRESP

data Payload
  = ConnectionOriented
      { length :: Int16
      , channelId :: ChannelIdentifier
      , information :: Int
      }
  | ConnectionLessOriented
      { length :: Int16
      , channelId :: ChannelIdentifier
      , information :: Int
      , psm :: Int16
      }

-- Signalling Commands
data SignallingPayload
  = CommandReject
      { reason :: Int16
      , _data :: Int
      , length :: Int16
      }

data Options a = Options
  { _type :: Int8
  , length :: Int8
  , _data :: a
  }

-- _type = 0x01
-- length = 2 bytes (hence it's Options Int16)
type MTUOption = Options Int16

-- _type = 0x02
-- length = 2 bytes (hence it's Options Int16)
type FlushTimeoutOption = Options Int16

-- | L@CAP SUPERVISORY FUNCTION IN S-FRAMES
data L2cap_supervisory_function_t
  = L2CAP_SUPERVISORY_FUNCTION_RR_RECEIVER_READY
  | L2CAP_SUPERVISORY_FUNCTION_REJ_REJECT
  | L2CAP_SUPERVISORY_FUNCTION_RNR_RECEIVER_NOT_READY
  | L2CAP_SUPERVISORY_FUNCTION_SREJ_SELECTIVE_REJECT

-- | L2CAP Information Types used in Information Request & Response
data L2cap_info_type_t
  = L2CAP_INFO_TYPE_CONNECTIONLESS_MTU
  | L2CAP_INFO_TYPE_EXTENDED_FEATURES_SUPPORTED
  | L2CAP_INFO_TYPE_FIXED_CHANNELS_SUPPORTED

-- | brief L2CAP Configuration Option Types used in Configurateion Request & Response
data L2cap_config_option_type_t
  = L2CAP_CONFIG_OPTION_TYPE_MAX_TRANSMISSION_UNIT
  | L2CAP_CONFIG_OPTION_TYPE_FLUSH_TIMEOUT
  | L2CAP_CONFIG_OPTION_TYPE_QUALITY_OF_SERVICE
  | L2CAP_CONFIG_OPTION_TYPE_RETRANSMISSION_AND_FLOW_CONTROL
  | L2CAP_CONFIG_OPTION_TYPE_FRAME_CHECK_SEQUENCE
  | L2CAP_CONFIG_OPTION_TYPE_EXTENDED_FLOW_SPECIFICATION
  | L2CAP_CONFIG_OPTION_TYPE_EXTENDED_WINDOW_SIZE 

-- | L2CAP Configuration Result Codes
data L2CAP_CONF_RESULT_SUCCESS = 0x0000
data L2CAP_CONF_RESULT_UNACCEPTABLE_PARAMETERS = 0x0001
data L2CAP_CONF_RESULT_REJECT = 0x0002
data L2CAP_CONF_RESULT_UNKNOWN_OPTIONS = 0x0003
data L2CAP_CONF_RESULT_PENDING = 0x0004
data L2CAP_CONF_RESULT_FLOW_SPEC_REJECTED = 0x0005


-- | L2CAP Reject Result Codes
data L2CAP_REJ_CMD_UNKNOWN = 0x0000
    
-- | Response Timeout eXpired
data L2CAP_RTX_TIMEOUT_MS = 10000

-- | Extended Response Timeout eXpired
data L2CAP_ERTX_TIMEOUT_MS =  120000

-- | nr of buffered acl packets in outgoing queue to get max performance 
data NR_BUFFERED_ACL_PACKETS = 3

-- | used to cache l2cap rejects, echo, and informational requests
data NR_PENDING_SIGNALING_RESPONSES = 3

-- | nr of credits provided to remote if credits fall below watermark
data L2CAP_CREDIT_BASED_FLOW_CONTROL_MODE_AUTOMATIC_CREDITS_WATERMARK = 5
data L2CAP_CREDIT_BASED_FLOW_CONTROL_MODE_AUTOMATIC_CREDITS_INCREMENT = 5

-- | offsets for L2CAP SIGNALING COMMANDS
data L2CAP_SIGNALING_COMMAND_CODE_OFFSET  =  0
data L2CAP_SIGNALING_COMMAND_SIGID_OFFSET =  1
data L2CAP_SIGNALING_COMMAND_LENGTH_OFFSET = 2
data L2CAP_SIGNALING_COMMAND_DATA_OFFSET = 4
