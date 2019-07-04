# Overview #

The finance department is combining Accounts and Transactions data using a spreadsheet.

## Account REST API ##

Request all accounts of a particular type (personal or business):

    GET http://apdev-accounts-ws.cloudhub.io/api/accounts 
    Header: Requester-ID
    Query Param: type=personal|business
    Optional Params: country?, name?
    Returns: Account[]

## Transaction SOAP ##

Request all the transactions:

    GET http://apdev-accounts-ws.cloudhub.io/api/transactions?wsdl

    Input payload:

        <?xml version='1.0' encoding='UTF-8'?>
        <ns0:GetTransactionsforCustomers xmlns:ns0="http://training.mulesoft.com/">
          <customerID>4402</customerID>
          <customerID>4404</customerID>
          <customerID>4464</customerID>
        </ns0:GetTransactionsforCustomers>


# TASK: Implement a Process API #

Consolidate the accounts into a single API that returns:

    {
      "accounts": Array of Account Objects
      "transactions": Array of all Transaction Objects for all accounts
    }

Then, upload the data to another endpoint:

    http://apdev-accounts-ws.cloudhub.io/api/accounts_transactions

    This call takes more than 10 seconds, 
    so configure the timeout (in miliseconds) appropriately.
    
