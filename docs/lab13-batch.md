retrieve data from database

1. configure Database:select
2. query the database with a parameterized query:

    SELECT * FROM table WHERE id>:id 
    ORDER BY id 
    LIMIT 5

create a compliance approval flow

1. create a VM listener
2. use a VM publish consume

process data in batch

1. Use a `Batch Scope`
2. Define the `Batch Steps` for processing
3. Use variables (bound to the execution unit, not global)
4. Define the `Accept Expression` and `Accept Policy` for each step
5. Aggregate the results in `Batch Aggregator`

processing batch

Batch Scope runs in the background and returns the status:

    {
        "creationTime": "2019-07-09T18:49:30",
        "recordCount": 17,
        "result": {
        "onCompletePhaseException": null,
        "loadingPhaseException": null,
        "totalRecords": 17,
        "elapsedTimeInMillis": 0,
        "failedOnCompletePhase": false,
        "failedRecords": 0,
        "loadedRecords": 17,
        "failedOnInputPhase": false,
        "successfulRecords": 0,
        "inputPhaseException": null,
        "processedRecords": 0,
        "failedOnLoadingPhase": false,
        "batchJobInstanceId": "6dfe8600-a293-11e9-936e-9e648b552655"
        },
        "id": "6dfe8600-a293-11e9-936e-9e648b552655",
        "ownerJobName": "batch_process",
        "status": "EXECUTING"
    }

# Error Handling #

The default Batch Scope behavior is to abort the execution once it finds
an error.

General error handling outside of `Batch Scope` does not work as expected.
The reason is that the execution takes place in the background.

It is possible to configure `Max Failed Records` to `-1`, which ignores the errors.


# Threading #

Batch Scopes are executed in sequence. The old behavior was to use
round robin strategy, which would allow batches to execute in different ordering.
https://blogs.mulesoft.com/dev/anypoint-platform-dev/batch-module-reloaded/

Inside the batch scope, the workload is first enqueued and then it is processed. 
A thread gathers a batch of messages (`batch size`) to execute. Thus, if a single
unit of execution is slow, then the whole batch step stalls.
