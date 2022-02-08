module Types.Event where

-- | L2CAP Events
data L2CAPEvent
  = L2CA_ConnectReq
  | L2CA_ConnectRsp
  | L2CA_ConnectRspNeg
  | L2CA_ConfigReq
  | L2CA_ConfigRsp
  | L2CA_ConfigRspNeg
  | L2CA_DisconnectReq
  | L2CA_DisconnectRsp
  | L2CA_DataRead
  | L2CA_DataWrite

-- | Timer Events
data TimerEvent
  = RTX
  | ERTX

-- | Define Protocol data unit  instancee\
instance Enum L2CAPEvent where
  fromEnum x = case x of
    L2CA_ConfigReq -> 0
    L2CA_ConnectRsp -> 1
    L2CA_ConnectRspNeg -> 2
    L2CA_ConfigReq -> 3
    L2CA_ConfigRsp -> 4
    L2CA_ConfigRspNeg -> 5
    L2CA_DisconnectRsp -> 6
    L2CA_DisconnectReq -> 7
    L2CA_DataRead -> 8
    L2CA_DataWrite -> 9

  toEnum v = case v of
    0 -> L2CA_ConfigReq
    1 -> L2CA_ConnectRsp
    2 -> L2CA_ConnectRspNeg
    3 -> L2CA_ConfigReq
    4 -> L2CA_ConfigRsp
    5 -> L2CA_ConfigRspNeg
    6 -> L2CA_DisconnectRsp
    7 -> L2CA_DisconnectReq
    8 -> L2CA_DataRead
    9 -> L2CA_DataWrite
