--
-- Show statistic names per class
--

break on class_name
column   class_name format a10

select
  decode(class,
    1, 'User',
    2, 'Redo',
    4, 'Enqueue',
    8, 'Cache',
   16, 'OS',
   32, 'RAC',
   64, 'SQL',
  128, 'Debug',
  192, 'SQL+Debug',
       '?: ' || class  )     class_name,
  ----------------------------
  name
from
  v$statname
order by
  class,
  lower(name);
User       application wait time
           bytes received via SQL*Net from client
           bytes received via SQL*Net from dblink
           bytes sent via SQL*Net to client
           bytes sent via SQL*Net to dblink
           bytes via SQL*Net vector from client
           bytes via SQL*Net vector from dblink
           bytes via SQL*Net vector to client
           bytes via SQL*Net vector to dblink
           cluster wait time
           commit batch performed
           commit batch requested
           commit batch/immediate performed
           commit batch/immediate requested
           commit immediate performed
           commit immediate requested
           commit nowait performed
           commit nowait requested
           commit wait performed
           commit wait requested
           commit wait/nowait performed
           commit wait/nowait requested
           concurrency wait time
           CPU used by this session
           DB time
           file io service time
           file io wait time
           in call idle wait time
           java call heap collected bytes
           java call heap collected count
           java call heap gc count
           java call heap live object count
           java call heap live object count max
           java call heap live size
           java call heap live size max
           java call heap object count
           java call heap object count max
           java call heap total size
           java call heap total size max
           java call heap used size
           java call heap used size max
           java session heap collected bytes
           java session heap collected count
           java session heap gc count
           java session heap live object count
           java session heap live object count max
           java session heap live size
           java session heap live size max
           java session heap object count
           java session heap object count max
           java session heap used size
           java session heap used size max
           logons cumulative
           logons current
           No. of Decrypt ops
           No. of Encrypt ops
           No. of Namespaces Created
           No. of Principal Cache Misses
           No. of Principal Invalidations
           No. of Roles Enabled or Disabled
           No. of User Callbacks Executed
           No. of XS Sessions Attached
           No. of XS Sessions Created
           non-idle wait count
           non-idle wait time
           opened cursors cumulative
           opened cursors current
           OS CPU Qt wait time
           pinned cursors current
           read-only violation count
           recursive calls
           recursive cpu usage
           Requests to/from client
           scheduler wait time
           serializable aborts
           session connect time
           session logical reads
           session logical reads in local numa group
           session logical reads in remote numa group
           session pga memory
           session pga memory max
           session stored procedure space
           session uga memory
           session uga memory max
           SQL*Net roundtrips to/from client
           SQL*Net roundtrips to/from dblink
           temp space allocated (bytes)
           user calls
           user commits
           user I/O wait time
           user rollbacks
           Workload Capture: dbtime
           Workload Capture: errors
           Workload Capture: size (in bytes) of recording
           Workload Capture: unreplayable user calls
           Workload Capture: unsupported user calls
           Workload Capture: user calls
           Workload Capture: user calls flushed
           Workload Capture: user logins
           Workload Capture: user txns
           Workload Replay: dbtime
           Workload Replay: deadlocks resolved
           Workload Replay: network time
           Workload Replay: think time
           Workload Replay: time gain
           Workload Replay: time loss
           Workload Replay: user calls
Redo       flashback log write bytes
           flashback log writes
           redo blocks checksummed by FG (exclusive)
           redo blocks checksummed by LGWR
           redo blocks read for recovery
           redo blocks written
           redo buffer allocation retries
           redo entries
           redo entries for lost write detection
           redo k-bytes read for recovery
           redo k-bytes read for terminal recovery
           redo KB read
           redo KB read (memory)
           redo KB read (memory) for transport
           redo KB read for transport
           redo log space requests
           redo log space wait time
           redo ordering marks
           redo size
           redo size for direct writes
           redo size for lost write detection
           redo subscn max counts
           redo synch poll writes
           redo synch polls
           redo synch time
           redo synch writes
           redo wastage
           redo write broadcast ack count
           redo write broadcast ack time
           redo write broadcast lgwr post count
           redo write time
           redo writes
Enqueue    enqueue conversions
           enqueue deadlocks
           enqueue releases
           enqueue requests
           enqueue timeouts
           enqueue waits
           max cf enq hold time
           total cf enq hold time
           total number of cf enq holders
Cache      background checkpoints completed
           background checkpoints started
           blocks decrypted
           blocks encrypted
           cell flash cache read hits
           cell physical IO bytes saved by storage index
           change write time
           checkpoint clones created for ADG recovery
           cold recycle reads
           commit cleanout failures: block lost
           commit cleanout failures: buffer being written
           commit cleanout failures: callback failure
           commit cleanout failures: cannot pin
           commit cleanout failures: hot backup in progress
           commit cleanout failures: write disabled
           commit cleanouts
           commit cleanouts successfully completed
           consistent changes
           consistent gets
           consistent gets - examination
           consistent gets direct
           consistent gets from cache
           consistent gets from cache (fastpath)
           CR blocks created
           current blocks converted for CR
           db block changes
           db block gets
           db block gets direct
           db block gets from cache
           db block gets from cache (fastpath)
           db corrupt blocks detected
           db corrupt blocks recovered
           DBWR checkpoint buffers written
           DBWR checkpoints
           DBWR lru scans
           DBWR object drop buffers written
           DBWR parallel query checkpoint buffers written
           DBWR revisited being-written buffer
           DBWR tablespace checkpoint buffers written
           DBWR thread checkpoint buffers written
           DBWR transaction table writes
           DBWR undo block writes
           dirty buffers inspected
           Effective IO time
           exchange deadlocks
           flash cache eviction: aged out
           flash cache eviction: buffer pinned
           flash cache eviction: invalidated
           flash cache insert skip: corrupt
           flash cache insert skip: DBWR overloaded
           flash cache insert skip: exists
           flash cache insert skip: modification
           flash cache insert skip: not current
           flash cache insert skip: not useful
           flash cache inserts
           flashback cache read optimizations for block new
           flashback direct read optimizations for block new
           free buffer inspected
           free buffer requested
           hot buffers moved to head of LRU
           lob reads
           lob writes
           lob writes unaligned
           logical read bytes from cache
           number of map misses
           number of map operations
           Number of read IOs issued
           physical read bytes
           physical read flash cache hits
           physical read IO requests
           physical read requests optimized
           physical read total bytes
           physical read total bytes optimized
           physical read total IO requests
           physical read total multi block requests
           physical reads
           physical reads cache
           physical reads cache prefetch
           physical reads direct
           physical reads direct (lob)
           physical reads direct temporary tablespace
           physical reads for flashback new
           physical reads prefetch warmup
           physical reads retry corrupt
           physical write bytes
           physical write IO requests
           physical write total bytes
           physical write total IO requests
           physical write total multi block requests
           physical writes
           physical writes direct
           physical writes direct (lob)
           physical writes direct temporary tablespace
           physical writes from cache
           physical writes non checkpoint
           pinned buffers inspected
           prefetch clients - 16k
           prefetch clients - 2k
           prefetch clients - 32k
           prefetch clients - 4k
           prefetch clients - 8k
           prefetch clients - default
           prefetch clients - keep
           prefetch clients - recycle
           prefetch warmup blocks aged out before use
           prefetch warmup blocks flushed out before use
           prefetched blocks aged out before use
           recovery array read time
           recovery array reads
           recovery block gets from cache
           recovery blocks read
           recovery blocks read for lost write detection
           recovery blocks skipped lost write checks
           shared hash latch upgrades - no wait
           shared hash latch upgrades - wait
           summed dirty queue length
           switch current to new buffer
           total number of slots
           write clones created for recovery
           write clones created in background
           write clones created in foreground
OS         OS Block input operations
           OS Block output operations
           OS Integral shared text size
           OS Integral unshared data size
           OS Integral unshared stack size
           OS Involuntary context switches
           OS Maximum resident set size
           OS Page faults
           OS Page reclaims
           OS Signals received
           OS Socket messages received
           OS Socket messages sent
           OS Swaps
           OS System time used
           OS User time used
           OS Voluntary context switches
RAC        calls to get snapshot scn: kcmgss
           DDL statements parallelized
           DFO trees parallelized
           DML statements parallelized
           gcs messages sent
           ges messages sent
           global enqueue CPU used by this session
           global enqueue get time
           global enqueue gets async
           global enqueue gets sync
           global enqueue releases
           GTX processes spawned by autotune
           GTX processes stopped by autotune
           IPC CPU used by this session
           Parallel operations downgraded 1 to 25 pct
           Parallel operations downgraded 25 to 50 pct
           Parallel operations downgraded 50 to 75 pct
           Parallel operations downgraded 75 to 99 pct
           Parallel operations downgraded to serial
           Parallel operations not downgraded
           PX local messages recv'd
           PX local messages sent
           PX remote messages recv'd
           PX remote messages sent
           queries parallelized
?: 33      Clusterwide global transactions
           Clusterwide global transactions spanning RAC nodes
           Forwarded 2PC commands across RAC nodes
?: 40      DBWR fusion writes
           gc blocks compressed
           gc blocks corrupt
           gc blocks lost
           gc claim blocks lost
           gc CPU used by this session
           gc cr block build time
           gc cr block flush time
           gc cr block receive time
           gc cr block send time
           gc cr blocks received
           gc cr blocks served
           gc current block flush time
           gc current block pin time
           gc current block receive time
           gc current block send time
           gc current blocks received
           gc current blocks served
           gc kbytes saved
           gc kbytes sent
           gc local grants
           gc read wait failures
           gc read wait time
           gc read wait timeouts
           gc read waits
           gc reader bypass grants
           gc remote grants
SQL        CCursor + sql area evicted
           cell blocks helped by commit cache
           cell blocks helped by minscn optimization
           cell commit cache queries
           cell CUs processed for compressed
           cell CUs processed for uncompressed
           cell CUs sent compressed
           cell CUs sent head piece
           cell CUs sent uncompressed
           cell index scans
           cell IO uncompressed bytes
           cell num fast response sessions
           cell num fast response sessions continuing to smart scan
           cell num smart file creation sessions using rdbms block IO mode
           cell num smart IO sessions in rdbms block IO due to big payload
           cell num smart IO sessions in rdbms block IO due to no cell mem
           cell num smart IO sessions in rdbms block IO due to user
           cell num smart IO sessions using passthru mode due to cellsrv
           cell num smart IO sessions using passthru mode due to timezone
           cell num smart IO sessions using passthru mode due to user
           cell physical IO bytes eligible for predicate offload
           cell physical IO bytes saved during optimized file creation
           cell physical IO bytes saved during optimized RMAN file restore
           cell physical IO bytes sent directly to DB node to balance CPU
           cell physical IO interconnect bytes
           cell physical IO interconnect bytes returned by smart scan
           cell scans
           cell smart IO session cache hard misses
           cell smart IO session cache hits
           cell smart IO session cache hwm
           cell smart IO session cache lookups
           cell smart IO session cache soft misses
           cell statistics spare1
           cell statistics spare2
           cell statistics spare3
           cell statistics spare4
           cell statistics spare5
           cell statistics spare6
           cell transactions found in commit cache
           chained rows processed by cell
           chained rows rejected by cell
           chained rows skipped by cell
           cluster key scan block gets
           cluster key scans
           execute count
           frame signature mismatch
           HCC Conventional DMLs
           HCC non-CU Compressed Blocks
           HCC: Number of times tried to non-CU Compress a Block
           heap block compress
           Heap Segment Array Inserts
           Heap Segment Array Updates
           HSC Compressed Segment Block Changes
           HSC Heap Segment Block Changes
           HSC IDL Compressed Blocks
           HSC OLTP Compressed Blocks
           HSC OLTP Non Compressible Blocks
           HSC OLTP Space Saving
           index crx upgrade (found)
           index crx upgrade (positioned)
           index crx upgrade (prefetch)
           index fast full scans (direct read)
           index fast full scans (full)
           index fast full scans (rowid ranges)
           native hash arithmetic execute
           native hash arithmetic fail
           parse count (describe)
           parse count (failures)
           parse count (hard)
           parse count (total)
           parse time cpu
           parse time elapsed
           rows fetched via callback
           session cursor cache count
           session cursor cache hits
           sorts (disk)
           sorts (memory)
           sorts (rows)
           sql area evicted
           sql area purged
           table fetch by rowid
           table fetch continued row
           table scan blocks gotten
           table scan rows gotten
           table scans (cache partitions)
           table scans (direct read)
           table scans (long tables)
           table scans (rowid ranges)
           table scans (short tables)
           workarea executions - multipass
           workarea executions - onepass
           workarea executions - optimal
           workarea memory allocated
?: 72      Batched IO (bound) vector count
           Batched IO (full) vector count
           Batched IO (space) vector count
           Batched IO block miss count
           Batched IO buffer defrag count
           Batched IO double miss count
           Batched IO same unit count
           Batched IO single block count
           Batched IO slow jump count
           Batched IO vector block count
           Batched IO vector read count
           Batched IO zero block count
           buffer is not pinned count
           buffer is pinned count
           no buffer to keep pinned count
Debug      active txn count during cleanout
           auto extends on undo tablespace
           background timeouts
           Block Cleanout Optim referenced
           branch node splits
           Cached Commit SCN referenced
           calls to kcmgas
           calls to kcmgcs
           calls to kcmgrs
           cell blocks processed by cache layer
           cell blocks processed by data layer
           cell blocks processed by index layer
           cell blocks processed by txn layer
           cleanout - number of ktugct calls
           cleanouts and rollbacks - consistent read gets
           cleanouts only - consistent read gets
           Commit SCN cached
           commit txn count during cleanout
           CPU used when call started
           cursor authentications
           data blocks consistent reads - undo records applied
           deferred (CURRENT) block cleanout applications
           deferred CUR cleanouts (index blocks)
           doubling up with imu segment
           drop segment calls in space pressure
           DX/BB enqueue lock background get time
           DX/BB enqueue lock background gets
           DX/BB enqueue lock foreground requests
           DX/BB enqueue lock foreground wait time
           EHCC Analyze CUs Decompressed
           EHCC Analyzer Calls
           EHCC Archive CUs Compressed
           EHCC Archive CUs Decompressed
           EHCC Check CUs Decompressed
           EHCC Columns Decompressed
           EHCC Compressed Length Compressed
           EHCC Compressed Length Decompressed
           EHCC CU Row Pieces Compressed
           EHCC CUs Compressed
           EHCC CUs Decompressed
           EHCC Decompressed Length Compressed
           EHCC Decompressed Length Decompressed
           EHCC DML CUs Decompressed
           EHCC Dump CUs Decompressed
           EHCC Normal Scan CUs Decompressed
           EHCC Pieces Buffered for Decompression
           EHCC Query High CUs Compressed
           EHCC Query High CUs Decompressed
           EHCC Query Low CUs Compressed
           EHCC Query Low CUs Decompressed
           EHCC Rowid CUs Decompressed
           EHCC Rows Compressed
           EHCC Rows Not Compressed
           EHCC Total Columns for Decompression
           EHCC Total Pieces for Decompression
           EHCC Total Rows for Decompression
           EHCC Turbo Scan CUs Decompressed
           failed probes on index block reclamation
           global undo segment hints helped
           global undo segment hints were stale
           HSC OLTP compression block checked
           HSC OLTP Compression skipped rows
           HSC OLTP Drop Column
           HSC OLTP inline compression
           HSC OLTP negative compression
           HSC OLTP positive compression
           HSC OLTP recursive compression
           immediate (CR) block cleanout applications
           immediate (CURRENT) block cleanout applications
           immediate CR cleanouts (index blocks)
           IMU bind flushes
           IMU commits
           IMU contention
           IMU CR rollbacks
           IMU Flushes
           IMU ktichg flush
           IMU mbu flush
           IMU pool not allocated
           IMU recursive-transaction flush
           IMU Redo allocation size
           IMU undo allocation size
           IMU undo retention flush
           IMU- failed to get a private strand
           index fetch by key
           index reclamation/extension switch
           index scans kdiixs1
           leaf node 90-10 splits
           leaf node splits
           LOB table id lookup cache misses
           local undo segment hints helped
           local undo segment hints were stale
           messages received
           messages sent
           min active SCN optimization applied on CR
           Misses for writing mapping
           no work - consistent read gets
           OTC commit optimization attempts
           OTC commit optimization failure - setup
           OTC commit optimization hits
           process last non-idle time
           queue flush
           queue ocp pages
           queue position update
           queue qno pages
           queue single row
           queue splits
           queue update without cp update
           recursive aborts on index block reclamation
           recursive system API invocations
           redo synch long waits
           redo synch time (usec)
           remote Oradebug requests
           rollback changes - undo records applied
           rollbacks only - consistent read gets
           root node splits
           RowCR - resume
           RowCR - row contention
           RowCR attempts
           RowCR hits
           securefile add dedupd lob to set
           securefile allocation bytes
           securefile allocation chunks
           securefile bytes cleartext
           securefile bytes deduplicated
           securefile bytes encrypted
           securefile bytes non-transformed
           securefile compressed bytes
           securefile create dedup set
           securefile dedup callback oper final
           securefile dedup fits inline
           securefile dedup flush too low
           securefile dedup hash collision
           securefile dedup prefix hash match
           securefile dedup wapp cache miss
           securefile destroy dedup set
           securefile direct read bytes
           securefile direct read ops
           securefile direct write bytes
           securefile direct write ops
           securefile inode ioreap time
           securefile inode read time
           securefile inode write time
           securefile number of flushes
           securefile number of non-transformed flushes
           securefile reject deduplication
           securefile rmv from dedup set
           securefile uncompressed bytes
           segment cfs allocations
           segment chunks allocation from disepnser
           segment dispenser allocations
           segment dispenser load empty
           segment dispenser load tasks
           segment prealloc bytes
           segment prealloc ops
           segment prealloc tasks
           segment prealloc time (ms)
           segment prealloc ufs2cfs bytes
           segment total chunk allocation
           shared io pool buffer get failure
           shared io pool buffer get success
           SMON posted for dropping temp segment
           SMON posted for instance recovery
           SMON posted for txn recovery for other instances
           SMON posted for undo segment recovery
           SMON posted for undo segment shrink
           space was found by tune down
           space was not found by tune down
           spare statistic 1
           spare statistic 2
           spare statistic 3
           spare statistic 4
           steps of tune down ret. in space pressure
           TBS Extension: bytes extended
           TBS Extension: files extended
           TBS Extension: tasks created
           TBS Extension: tasks executed
           total number of times SMON posted
           total number of undo segments dropped
           transaction lock background get time
           transaction lock background gets
           transaction lock foreground requests
           transaction lock foreground wait time
           transaction rollbacks
           transaction tables consistent read rollbacks
           transaction tables consistent reads - undo records applied
           tune down retentions in space pressure
           undo change vector size
           undo segment header was pinned
SQL+Debug  cell simulated physical IO bytes eligible for predicate offload
           cell simulated physical IO bytes returned by predicate offload
