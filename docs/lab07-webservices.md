
The finance department is combining Accounts and Transactions data using a spreadsheet.

Implement a Process API

Account API
http://apdev-accounts-ws.cloudhub.io/api/accounts to request all accounts of a particular type (personal or business).

GET type=personal|business
Header: Requester-ID
Params: country?, name?
Returns Account[]

Transfer Accounts API
GET
Requester-ID
type=personal|business
-> Accounts API
Response: string = number of messages processed

Mule App : Account API
Validator or Choice
type default



Transaction SOAP

http://apdev-accounts-ws.cloudhub.io/api/transactions?wsdl

<?xml version='1.0' encoding='UTF-8'?>

<ns0:GetTransactionsforCustomers xmlns:ns0="http://training.mulesoft.com/">

  <customerID>4402</customerID>

  <customerID>4404</customerID>

  <customerID>4464</customerID>

</ns0:GetTransactionsforCustomers>

combine


{

  "accounts": Array of Account Objects

  "transactions": Array of all Transaction Objects for all accounts

}


JOIN Accounts

http://apdev-accounts-ws.cloudhub.io/api/accounts_transactions
