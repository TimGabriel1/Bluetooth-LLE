module Types.LinkLayer where

import Data.Int 

-- Link Layer specification Section 1.1, Core 4.1 page 2499 
data State/* Connection state channel map
 * Must not be modified directly, use function ll_set_data_ch_map() instead */
static struct {
	uint64_t mask:40;
	uint8_t used[LL_DATA_CH_NB];
	uint8_t cnt;
} data_ch_map;= LL_STATE_STANDBY
    | LL_STATE_ADVERTISING
    | LL_STATE_SCANNING
    | LL_STATE_INITIATING
    | LL_STATE_CONNECTION

-- Link Layer specification Section 2.3, Core 4.1 pages 2504-2505 */
data LL_PDU_ADV  
    = LL_PDU_ADV
    {   
    type :: Int8 
    , _rfu_0 :: Int8
    , tx_add :: Int8
    , rx_add :: Int8
    , length :: Int8
    , _rfu_1 :: Int8
    , payload :: Int8
    }

--  Link Layer specification Section 2.3, Core 4.1 pages 2508 
data LL_PDU_SCAN_REQ = LL_PDU_SCAN_REQ 
    {
	    scana :: Int8
    ,   adva :: Int8
    }

data LL_PDU_CONNECT_PAYLOAD = LL_PDU_CONNECT_PAYLOAD 
    { 
    init_add :: Int8	    --  Initiator address 
	, adv_add :: Int8         --  Advertiser address 
	, aa :: Int32			    --  connection Access Address 
	, crc_init :: Int32       --  connection CRC init 
	, win_size :: Int8	    --  tx window size (*1.25ms) 
	, win_offset :: Int16		--  tx window offset (*1.25ms) 
	, interval :: Int16 	    --  conn. interval (*1.25ms) 
	, latency :: Int16 		--  conn. slave latency 
	, timeout :: Int16 	    --  conn. supervision (*10ms) 
	, ch_map  :: Int64		--  channel map 
	, hop :: Int8			    --  hop increment 
	, sca	:: Int8             --  Master sleep clock accuracy
    }
    
-- Connection state channel map
-- Must not be modified directly, use function ll_set_data_ch_map() instead */
data data_ch_map = data_ch_map
    {
	mask :: Int64
    , used :: Int8 
    , cnt :: Int8
    } 

-- Link Layer specification Section 2.3, Core 4.1 page 2505 
data  ll_pdu_t 
	= LL_PDU_ADV_IND
	| LL_PDU_ADV_DIRECT_IND
	| LL_PDU_ADV_NONCONN_IND
	| LL_PDU_SCAN_REQ
	| LL_PDU_SCAN_RSP
	| LL_PDU_CONNECT_REQ
	| LL_PDU_ADV_SCAN_IND

-- brief Connection parameters structure 
-- TODO helper macros to convert to and from us 
typedef struct {
	/** range: 7.5ms -> 4s, unit: 1.25ms */
	uint16_t	conn_interval_min;
	/** range: 7.5ms -> 4s, unit: 1.25ms */
	uint16_t	conn_interval_max;
	/** range : 0 -> 499, slave latency in number of connection events */
	uint16_t	conn_latency;
	/** range: 100ms -> 32s, unit: 10ms */
	uint16_t	supervision_timeout;
	/** range: 0ms -> 40s, unit: 0.625ms, min. length of connection events*/
	uint16_t	minimum_ce_length;
	/** range: 0ms -> 40s, unit: 0.625ms, max. length of connection events*/
	uint16_t	maximum_ce_length;
} ll_conn_params_t;
